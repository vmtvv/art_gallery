import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';

class GalleryListItem extends StatelessWidget {
  final domain.ArtObject artObject;
  final Function(domain.ArtObject) onTap;

  const GalleryListItem(
      {Key? key, required this.artObject, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(artObject),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        semanticContainer: true,
        child: Stack(
          children: [
            Container(
              foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black45,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, 1],
                ),
              ),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: artObject.headerImage != null &&
                        artObject.headerImage!.url.isNotEmpty
                    ? Image.network(
                        artObject.headerImage!.url,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const NoImage(),
                      )
                    : null,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Text(
                    artObject.title,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
