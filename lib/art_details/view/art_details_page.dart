import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtDetailsPage extends StatefulWidget {
  const ArtDetailsPage({Key? key}) : super(key: key);

  static Route<void> route({required ArtDetailsArguments arguments}) {
    return MaterialPageRoute(
      builder: (context) => const ArtDetailsPage(),
      settings: RouteSettings(
        arguments: arguments,
      ),
    );
  }

  @override
  ArtDetailsPageState createState() {
    return ArtDetailsPageState();
  }
}

class ArtDetailsPageState extends State<ArtDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArtDetailsArguments;
    return BlocProvider(
      create: (context) => ArtDetailsBloc(
          artCollectionRepository:
              RepositoryProvider.of<domain.ArtCollectionRepository>(context))
        ..add(ArtDetailsNumberSelected(args.number)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context, args.image),
              _buildDetails(context),
              const SizedBox(height: 16),
            ],
          ),
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
                )
              : const SizedBox.shrink(),
        ),
        SafeArea(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Navigate back',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return BlocBuilder<ArtDetailsBloc, ArtDetailsState>(
      builder: ((context, state) {
        if (state.status == ArtDetailsStatus.loaded) {
          final objectDetails = state.artObjectDetails!;
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
        } else {
          return Container(
            margin: const EdgeInsets.all(32),
            child: Center(
              child: state.status == ArtDetailsStatus.loading
                  ? const CircularProgressIndicator()
                  : const Text('no information'),
            ),
          );
        }
      }),
    );
  }
}
