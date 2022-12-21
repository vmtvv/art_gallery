import 'package:art_gallery/domain/art_collection/art_collection.dart';

abstract class ArtCollectionRepository {
  Future<ArtCollection> getCollection({
    int? century,
    String? involvedMaker,
    int? page,
    int? countPerPage,
    ArtCollectionSorting? sorting,
    bool? imgOnly,
  });

  Future<ArtObjectDetails> getArtObjectDetails({required String objectNumber});

  void dispose();
}
