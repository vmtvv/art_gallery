import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GalleryFilterChips extends StatelessWidget {
  const GalleryFilterChips({super.key, required this.onFilterPickerToggle});

  final Function() onFilterPickerToggle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.only(left: 8, right: 8),
            scrollDirection: Axis.horizontal,
            children: [
              ActionChip(
                avatar: const Icon(Icons.filter_alt_rounded),
                label:
                    Text(AppLocalizations.of(context)!.gallery_filter_button),
                onPressed: onFilterPickerToggle,
              ),
              if (state.filter.involvedMaker != null)
                GalleryFilterChipsItem(
                  title: state.filter.involvedMaker.toString(),
                  onDeleted: () {
                    context.read<GalleryBloc>().add(
                          GalleryFilterChanged(
                            filter: state.filter.withInvolvedMaker(null),
                          ),
                        );
                  },
                ),
              if (state.filter.century != null)
                GalleryFilterChipsItem(
                  title: state.filter.century!.name,
                  onDeleted: () {
                    context.read<GalleryBloc>().add(
                          GalleryFilterChanged(
                            filter: state.filter.withCentury(null),
                          ),
                        );
                  },
                ),
              if (state.filter.imgOnly)
                GalleryFilterChipsItem(
                  title: AppLocalizations.of(context)!
                      .gallery_filter_has_image_label,
                  onDeleted: () {
                    context.read<GalleryBloc>().add(
                          GalleryFilterChanged(
                            filter: state.filter.withImgOnly(false),
                          ),
                        );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
