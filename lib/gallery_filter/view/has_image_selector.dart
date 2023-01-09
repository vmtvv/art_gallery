import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HasImageSelector extends StatefulWidget {
  const HasImageSelector({Key? key}) : super(key: key);

  @override
  HasImageSelectorState createState() {
    return HasImageSelectorState();
  }
}

class HasImageSelectorState extends State<HasImageSelector> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryFilterBloc, GalleryFilterState>(
        builder: (context, state) {
      return CheckboxListTile(
        title:
            Text(AppLocalizations.of(context)!.gallery_filter_has_image_label),
        value: state.hasImage,
        onChanged: (bool? value) {
          if (value != null) {
            context
                .read<GalleryFilterBloc>()
                .add(GalleryFilterHasImageChanged(value));
          }
        },
      );
    });
  }
}
