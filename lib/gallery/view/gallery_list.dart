import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({super.key, required this.onItemTap});

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
    return BlocBuilder<GalleryBloc, GalleryState>(
      builder: (context, state) {
        switch (state.status) {
          case GalleryStatus.failure:
            return _buildError(context);
          case GalleryStatus.success:
            return _buildList(context, state.artObjects, state.hasReachedMax);
          case GalleryStatus.initial:
            return const ActivityIndicator();
        }
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    List<ArtObject> artObjects,
    bool hasReachedMax,
  ) {
    if (artObjects.isEmpty) {
      return Center(
          child: Text(AppLocalizations.of(context)!.gallery_list_empty));
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= artObjects.length
            ? const ActivityIndicator(size: 24, strokeWidth: 1.5)
            : GalleryItem(
                artObject: artObjects[index],
                onTap: widget.onItemTap,
              );
      },
      itemCount: hasReachedMax ? artObjects.length : artObjects.length + 1,
      controller: _scrollController,
    );
  }

  Widget _buildError(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RetryView(
              onPressed: () =>
                  context.read<GalleryBloc>().add(GalleryFetched()),
            ),
          ],
        ),
      ],
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
