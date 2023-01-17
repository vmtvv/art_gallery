import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryFilterPicker extends StatefulWidget {
  const GalleryFilterPicker({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const GalleryFilterPicker(),
    );
  }

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
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 350,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SafeArea(
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
                      Row(
                        children: const [
                          Expanded(
                            child: CenturyInput(),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: HasImageSelector(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<GalleryFilterBloc>()
                                .add(const GalleryFilterApplied());
                            _close(context);
                          },
                          child: Text(AppLocalizations.of(context)!
                              .gallery_filter_apply_button)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => _close(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
