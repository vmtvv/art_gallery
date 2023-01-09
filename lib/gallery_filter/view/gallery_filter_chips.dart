import 'package:art_gallery/gallery/gallery.dart';
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
      child: Container(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<GalleryBloc, GalleryState>(
          builder: (context, state) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.filter_alt_rounded),
                  label:
                      Text(AppLocalizations.of(context)!.gallery_filter_button),
                  onPressed: onFilterPickerToggle,
                ),
                if (state.filter.century != null)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: InputChip(
                      label: Text(state.filter.century!.name),
                      onDeleted: () {
                        context.read<GalleryBloc>().add(
                              GalleryFilterChanged(
                                filter: state.filter.withCentury(null),
                              ),
                            );
                      },
                    ),
                  ),
                if (state.filter.involvedMaker != null)
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: InputChip(
                      label: Text(state.filter.involvedMaker.toString()),
                      onDeleted: () {
                        context.read<GalleryBloc>().add(
                              GalleryFilterChanged(
                                filter: state.filter.withInvolvedMaker(null),
                              ),
                            );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
