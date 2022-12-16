import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= widget.artObjects.length
            ? const ActivityIndicator(size: 24, strokeWidth: 1.5)
            : GalleryItem(
                artObject: widget.artObjects[index],
                onTap: widget.onItemTap,
              );
      },
      itemCount: widget.hasReachedMax
          ? widget.artObjects.length
          : widget.artObjects.length + 1,
      controller: _scrollController,
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
