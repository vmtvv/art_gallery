import 'package:flutter/material.dart';

class GalleryFilterChipsItem extends StatelessWidget {
  const GalleryFilterChipsItem({
    Key? key,
    required this.title,
    required this.onDeleted,
  }) : super(key: key);

  final String title;
  final Function() onDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: InputChip(
        label: Text(title),
        onDeleted: onDeleted,
      ),
    );
  }
}
