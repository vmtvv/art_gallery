enum ArtCollectionSorting {
  relevance(value: 'relevance'),
  objectType(value: 'objecttype'),
  chronologic(value: 'chronologic'),
  achronologic(value: 'achronologic'),
  artist(value: 'artist'),
  artistDesc(value: 'artistdesc');

  const ArtCollectionSorting({required this.value});

  final String value;
}
