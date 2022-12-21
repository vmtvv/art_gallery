import 'package:flutter/material.dart';

class GallerySectionHeader extends StatelessWidget {
  final String title;

  const GallerySectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
      child: Text(title),
    );
  }
}
