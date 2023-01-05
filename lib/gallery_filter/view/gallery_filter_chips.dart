import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GalleryFilterChips extends StatelessWidget {
  const GalleryFilterChips({super.key, required this.onFilterPickerToggle});

  final Function() onFilterPickerToggle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return ActionChip(
                avatar: const Icon(Icons.filter_alt_rounded),
                label:
                    Text(AppLocalizations.of(context)!.gallery_filter_button),
                onPressed: onFilterPickerToggle,
              );
            }
            return InputChip(
              label: Text('$index'),
              onDeleted: () {},
            );
          },
        ),
      ),
    );
  }
}
