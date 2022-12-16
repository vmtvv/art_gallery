import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';

class GalleryError extends StatelessWidget {
  const GalleryError({super.key, required this.onRetry});
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RetryView(onPressed: onRetry),
          ],
        ),
      ],
    );
  }
}
