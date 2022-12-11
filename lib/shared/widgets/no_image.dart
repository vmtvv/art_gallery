import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.no_image_placeholder,
      ),
    );
  }
}
