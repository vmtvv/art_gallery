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

class ArtDetailsView extends StatelessWidget {
  const ArtDetailsView({super.key, this.image});

  final domain.Image? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArtDetailsHeader(image: image),
            Container(
              margin: const EdgeInsets.all(32),
              child: BlocBuilder<ArtDetailsBloc, ArtDetailsState>(
                builder: ((context, state) {
                  switch (state.status) {
                    case ArtDetailsStatus.initial:
                      return const ActivityIndicator();
                    case ArtDetailsStatus.failure:
                      return RetryView(
                        onPressed: () => context.read<ArtDetailsBloc>().add(
                            ArtDetailsNumberSelected(state.selectedNumber!)),
                      );
                    case ArtDetailsStatus.success:
                      final objectDetails = state.artObjectDetails;
                      if (objectDetails != null) {
                        return ArtDetailsInfo(artObjectDetails: objectDetails);
                      } else {
                        return Text(AppLocalizations.of(context)!
                            .art_details_no_information);
                      }
                  }
                }),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
