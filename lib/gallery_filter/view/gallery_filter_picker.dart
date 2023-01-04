import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryFilterPicker extends StatefulWidget {
  const GalleryFilterPicker({Key? key, required this.onClose})
      : super(key: key);

  static const double height = 350;
  static const Duration transitionDuration = Duration(milliseconds: 200);

  final Function() onClose;

  @override
  GalleryFilterPickerState createState() {
    return GalleryFilterPickerState();
  }
}

class GalleryFilterPickerState extends State<GalleryFilterPicker> {
  final TextEditingController _involvedMakerController =
      TextEditingController();

  @override
  void dispose() {
    _involvedMakerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 9.0,
            offset: Offset(0, 2),
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ],
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: GalleryFilterPicker.height,
              child: BlocBuilder<GalleryFilterBloc, GalleryFilterState>(
                builder: (context, state) {
                  _involvedMakerController.text = state.involvedMaker ?? '';
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.gallery_filter_title,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .gallery_filter_century_label,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<int?>(
                              value: state.century,
                              items: [
                                const DropdownMenuItem(
                                  value: null,
                                  child: Text(''),
                                ),
                                for (int i = 1; i <= 21; i++)
                                  DropdownMenuItem(
                                    value: i,
                                    child: Text('$i'),
                                  ),
                              ],
                              onChanged: (item) => context
                                  .read<GalleryFilterBloc>()
                                  .add(GalleryFilterCenturyChanged(item)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _involvedMakerController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: AppLocalizations.of(context)!
                                  .gallery_filter_involved_maker_label),
                          onChanged: (value) => context
                              .read<GalleryFilterBloc>()
                              .add(GalleryFilterInvolvedMakerChanged(value)),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                            onPressed: (() => context
                                .read<GalleryFilterBloc>()
                                .add(const GalleryFilterApplied())),
                            child: Text(AppLocalizations.of(context)!
                                .gallery_filter_apply_button)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: widget.onClose,
            ),
          ),
        ],
      ),
    );
  }
}
