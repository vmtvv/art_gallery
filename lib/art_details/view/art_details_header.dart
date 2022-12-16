import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArtDetailsHeader extends StatelessWidget {
  const ArtDetailsHeader({super.key, this.image});

  final domain.Image? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: image != null && image!.url.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/image_placeholder.jpg',
                  placeholderFit: BoxFit.fill,
                  image: image!.url,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const NoImage(),
                )
              : const SizedBox.shrink(),
        ),
        SafeArea(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip:
                AppLocalizations.of(context)!.art_details_back_button_tooltip,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
