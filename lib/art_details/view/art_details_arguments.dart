import 'package:art_gallery/domain/domain.dart';

class ArtDetailsArguments {
  final String number;
  final String title;
  final Image? image;

  ArtDetailsArguments({required this.title, required this.number, this.image});
}
