import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery/gallery.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildArtObjectList(context),
    );
  }

  Widget _buildArtObjectList(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryBloc(
          artCollectionRepository:
              RepositoryProvider.of<ArtCollectionRepository>(context))
        ..add(const GalleryCenturySelected(19)),
      child: BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
        if (state.status == GalleryStatus.loaded) {
          return SafeArea(
            bottom: false,
            child: ListView.builder(
              itemCount: state.artCollection!.artObjects.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const GallerySectionHeader(title: 'Section');
                } else {
                  return GalleryItem(
                    artObject: state.artCollection!.artObjects[index - 1],
                    onTap: (artOject) => _navigateToArtObjectDetails(),
                  );
                }
              },
            ),
          );
        } else if (state.status == GalleryStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(
            child: Text('empty'),
          );
        }
      }),
    );
  }

  void _navigateToArtObjectDetails() {}
}
