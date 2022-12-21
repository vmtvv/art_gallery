import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({
    super.key,
    required this.artObjects,
    required this.hasReachedMax,
    required this.onItemTap,
  });

  final List<ArtObject> artObjects;
  final bool hasReachedMax;
  final Function(ArtObject) onItemTap;

  @override
  State<GalleryList> createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.artObjects.isEmpty) {
      return Center(
          child: Text(AppLocalizations.of(context)!.gallery_list_empty));
    }
    return SafeArea(
      bottom: false,
      child: GroupedListView<ArtObject, String>(
        elements: widget.artObjects,
        groupBy: (element) => element.principalOrFirstMaker,
        groupSeparatorBuilder: ((value) => GallerySectionHeader(title: value)),
        itemBuilder: (context, element) {
          return GalleryItem(
            artObject: element,
            onTap: widget.onItemTap,
          );
        },
        controller: _scrollController,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<GalleryBloc>().add(GalleryFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
