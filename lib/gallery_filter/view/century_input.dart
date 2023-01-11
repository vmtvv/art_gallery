import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CenturyInput extends StatefulWidget {
  const CenturyInput({Key? key}) : super(key: key);

  @override
  CenturyInputState createState() {
    return CenturyInputState();
  }
}

class CenturyInputState extends State<CenturyInput> {
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryFilterBloc, GalleryFilterState>(
        builder: (context, state) {
      return SizedBox(
        width: 160,
        height: 56,
        child: InputDecorator(
          decoration: InputDecoration(
            hintText:
                AppLocalizations.of(context)!.gallery_filter_century_label,
            filled: true,
            suffixIcon: state.century != null
                ? IconButton(
                    icon: const Icon(Icons.highlight_remove_rounded),
                    onPressed: () => context
                        .read<GalleryFilterBloc>()
                        .add(const GalleryFilterCenturyChanged(null)),
                  )
                : null,
          ),
          isEmpty: state.century == null,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ArtCollectionCentury?>(
              value: state.century,
              items: [
                for (int i = 0; i < artCollectionCenturies.length; i++)
                  DropdownMenuItem(
                    value: artCollectionCenturies[i],
                    child: Text(artCollectionCenturies[i].name),
                  ),
              ],
              onChanged: (item) => context
                  .read<GalleryFilterBloc>()
                  .add(GalleryFilterCenturyChanged(item)),
            ),
          ),
        ),
      );
    });
  }
}
