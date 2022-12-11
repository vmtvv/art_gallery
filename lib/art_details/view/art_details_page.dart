import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtDetailsPage extends StatelessWidget {
  const ArtDetailsPage({super.key});

  static Route<void> route({required ArtDetailsArguments arguments}) {
    return MaterialPageRoute(
      builder: (context) => const ArtDetailsPage(),
      settings: RouteSettings(
        arguments: arguments,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArtDetailsArguments;

    return BlocProvider(
      create: (context) => ArtDetailsBloc(
          artCollectionRepository:
              RepositoryProvider.of<domain.ArtCollectionRepository>(context))
        ..add(ArtDetailsNumberSelected(args.number)),
      child: ArtDetailsView(image: args.image),
    );
  }
}

class ArtDetailsView extends StatefulWidget {
  const ArtDetailsView({super.key, this.image});

  final domain.Image? image;

  @override
  ArtDetailsViewState createState() {
    return ArtDetailsViewState();
  }
}

class ArtDetailsViewState extends State<ArtDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: _buildHeader(context, widget.image),
            ),
            _buildBody(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, domain.Image? image) {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: image != null && image.url.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/image_placeholder.jpg',
                  placeholderFit: BoxFit.fill,
                  image: image.url,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const NoImage(),
                )
              : const SizedBox.shrink(),
        ),
        SafeArea(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip:
                AppLocalizations.of(context)!.art_details_back_button_tooltip,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ArtDetailsBloc, ArtDetailsState>(
      builder: ((context, state) {
        switch (state.status) {
          case ArtDetailsStatus.initial:
            return Container(
              margin: const EdgeInsets.all(32),
              child: const ActivityIndicator(),
            );
          case ArtDetailsStatus.failure:
            return Container(
              margin: const EdgeInsets.all(32),
              child: RetryView(
                onPressed: () => context
                    .read<ArtDetailsBloc>()
                    .add(ArtDetailsNumberSelected(state.selectedNumber!)),
              ),
            );
          case ArtDetailsStatus.success:
            final objectDetails = state.artObjectDetails;
            if (objectDetails != null) {
              return _buildDetails(objectDetails);
            } else {
              return Container(
                margin: const EdgeInsets.all(32),
                child: Text(
                    AppLocalizations.of(context)!.art_details_no_information),
              );
            }
        }
      }),
    );
  }

  Widget _buildDetails(domain.ArtObjectDetails objectDetails) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(left: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              objectDetails.longTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              objectDetails.subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              objectDetails.plaqueDescription,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
