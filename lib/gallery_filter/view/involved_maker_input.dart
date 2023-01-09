import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InvolvedMakerInput extends StatefulWidget {
  const InvolvedMakerInput({Key? key}) : super(key: key);

  @override
  InvolvedMakerInputState createState() {
    return InvolvedMakerInputState();
  }
}

class InvolvedMakerInputState extends State<InvolvedMakerInput> {
  final TextEditingController _involvedMakerController =
      TextEditingController();

  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    _involvedMakerController.addListener(_onInvolvedMakerChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GalleryFilterBloc, GalleryFilterState>(
      listener: (context, state) {
        if (state.status == GalleryFilterStatus.clean) {
          _involvedMakerController.text = state.involvedMaker ?? '';
        }
      },
      child: TextField(
        controller: _involvedMakerController,
        decoration: InputDecoration(
          filled: true,
          labelText:
              AppLocalizations.of(context)!.gallery_filter_involved_maker_label,
          suffixIcon: !isEmpty
              ? IconButton(
                  icon: const Icon(Icons.highlight_remove_rounded),
                  onPressed: () => _involvedMakerController.clear(),
                )
              : null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _involvedMakerController
      ..removeListener(_onInvolvedMakerChanged)
      ..dispose();
    super.dispose();
  }

  void _onInvolvedMakerChanged() {
    setState(() {
      isEmpty = _involvedMakerController.text.isEmpty;
    });

    context
        .read<GalleryFilterBloc>()
        .add(GalleryFilterInvolvedMakerChanged(_involvedMakerController.text));
  }
}
