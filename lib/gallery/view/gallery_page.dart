import 'package:art_gallery/art_details/view/view.dart';
import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const GalleryPage());
  }

  @override
  GalleryPageState createState() {
    return GalleryPageState();
  }
}

class GalleryPageState extends State<GalleryPage> {
  final int _artCollectionCentury = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GalleryBloc(
            artCollectionRepository:
                RepositoryProvider.of<ArtCollectionRepository>(context))
          ..add(GalleryCenturySelected(_artCollectionCentury)),
        child:
            BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
          if (state.status == GalleryStatus.loaded) {
            return _buildArtObjectList(context, state.artCollection!);
          } else if (state.status == GalleryStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _buildError(context);
          }
        }),
      ),
    );
  }

  Widget _buildArtObjectList(
      BuildContext context, ArtCollection artCollection) {
    return SafeArea(
      bottom: false,
      child: ListView.builder(
        itemCount: artCollection.artObjects.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const GallerySectionHeader(title: 'Section');
          } else {
            return GalleryItem(
              artObject: artCollection.artObjects[index - 1],
              onTap: (artObject) => _navigateToArtObjectDetails(artObject),
            );
          }
        },
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Retry(
              onPressed: () => context
                  .read<GalleryBloc>()
                  .add(GalleryCenturySelected(_artCollectionCentury)),
            ),
          ],
        ),
      ],
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
