import 'package:art_gallery/domain/domain.dart';

class ArtCollectionFilter {
  const ArtCollectionFilter({
    this.century,
    this.involvedMaker,
    this.imgOnly = false,
    this.sorting,
  });

  final ArtCollectionCentury? century;
  final String? involvedMaker;
  final bool imgOnly;
  final ArtCollectionSorting? sorting;

  ArtCollectionFilter withCentury(ArtCollectionCentury? century) {
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

  ArtCollectionFilter withImgOnly(bool imgOnly) {
    return ArtCollectionFilter(
        century: century,
        involvedMaker: involvedMaker,
        imgOnly: imgOnly,
        sorting: sorting);
  }
}
