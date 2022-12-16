import 'package:art_gallery/domain/domain.dart';
import 'package:flutter/material.dart';

class ArtDetailsInfo extends StatelessWidget {
  const ArtDetailsInfo({super.key, required this.artObjectDetails});

  final ArtObjectDetails artObjectDetails;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artObjectDetails.longTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              artObjectDetails.subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              artObjectDetails.plaqueDescription,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
