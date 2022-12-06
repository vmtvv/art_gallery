import 'package:flutter/material.dart';

class GallerySectionHeader extends StatelessWidget {
  final String title;

  const GallerySectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 16),
        child: Text(title),
      ),
    );
  }
}
