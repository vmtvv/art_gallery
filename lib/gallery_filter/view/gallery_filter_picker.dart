import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryFilterPicker extends StatelessWidget {
  const GalleryFilterPicker({Key? key, required this.onClose})
      : super(key: key);

  final Function() onClose;

  @override
  Widget build(BuildContext context) {
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
                onClose();
              },
              child: Text(
                  AppLocalizations.of(context)!.gallery_filter_apply_button)),
        ],
      ),
    );
  }
}
