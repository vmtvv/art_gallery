import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _artCollectionCentury = 19;

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const GalleryPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryBloc(
          artCollectionRepository:
              RepositoryProvider.of<ArtCollectionRepository>(context))
        ..add(const GalleryCenturySelected(_artCollectionCentury)),
      child: const GalleryView(),
    );
  }
}

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  GalleryViewState createState() {
    return GalleryViewState();
  }
}

class GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          switch (state.status) {
            case GalleryStatus.failure:
              return GalleryError(
                onRetry: () =>
                    context.read<GalleryBloc>().add(GalleryFetched()),
              );
            case GalleryStatus.success:
              return GalleryList(
                artObjects: state.artObjects,
                hasReachedMax: state.hasReachedMax,
                onItemTap: _navigateToArtObjectDetails,
              );
            case GalleryStatus.initial:
              return const ActivityIndicator();
          }
        },
      ),
    );
  }

  void _navigateToArtObjectDetails(ArtObject artObject) {
    final arguments = ArtDetailsArguments(
        title: artObject.longTitle,
        number: artObject.number,
        image: artObject.image);
    Navigator.push(context, ArtDetailsPage.route(arguments: arguments));
  }
}
