import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:art_gallery/gallery_filter/view/century_input.dart';
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
            child: SafeArea(
              child: SizedBox(
                height: GalleryFilterPicker.height,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.gallery_filter_title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 32),
                      const InvolvedMakerInput(),
                      const SizedBox(height: 24),
                      const CenturyInput(),
                      const SizedBox(height: 32),
                      ElevatedButton(
                          onPressed: (() => context
                              .read<GalleryFilterBloc>()
                              .add(const GalleryFilterApplied())),
                          child: Text(AppLocalizations.of(context)!
                              .gallery_filter_apply_button)),
                    ],
                  ),
                ),
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
