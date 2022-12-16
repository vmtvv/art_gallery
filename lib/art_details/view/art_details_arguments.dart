import 'package:art_gallery/domain/domain.dart';

class ArtDetailsArguments {
  final String number;
  final String title;
  final Image? image;

  ArtDetailsArguments({required this.number, required this.title, this.image});
}
