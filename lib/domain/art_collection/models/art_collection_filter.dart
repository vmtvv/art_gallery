import 'package:art_gallery/domain/domain.dart';

class ArtCollectionFilter {
  const ArtCollectionFilter({
    this.century,
    this.involvedMaker,
    this.imgOnly,
    this.sorting,
  });

  final int? century;
  final String? involvedMaker;
  final bool? imgOnly;
  final ArtCollectionSorting? sorting;

  ArtCollectionFilter withCentury(int? century) {
    return ArtCollectionFilter(
        century: century,
        involvedMaker: involvedMaker,
        imgOnly: imgOnly,
        sorting: sorting);
  }

  ArtCollectionFilter withInvolvedMaker(String? involvedMaker) {
    return ArtCollectionFilter(
        century: century,
        involvedMaker: involvedMaker,
        imgOnly: imgOnly,
        sorting: sorting);
  }
}
