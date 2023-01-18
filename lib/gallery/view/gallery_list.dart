import 'package:art_gallery/domain/art_collection/art_collection.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  bool _bottomButtonVisible = false;

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
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          SafeArea(
            bottom: false,
            child: constraints.maxWidth < 600
                ? ListView(
                    controller: _scrollController,
                    children: [
                      ..._mapGalleryItems(widget.artObjects),
                    ],
                  )
                : SingleChildScrollView(
                    controller: _scrollController,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        ..._mapGalleryItems(widget.artObjects),
                      ],
                    ),
                  ),
          ),
          AnimatedPositioned(
            top: _bottomButtonVisible
                ? constraints.maxHeight - 80
                : constraints.maxHeight,
            duration: const Duration(milliseconds: 100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: _scrollTop,
                  icon: const Icon(Icons.keyboard_arrow_up_rounded),
                  label: Text(
                      AppLocalizations.of(context)!.gallery_list_bottom_button),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  List<Widget> _mapGalleryItems(List<ArtObject> artobjects) {
    final itemCount = widget.hasReachedMax
        ? widget.artObjects.length
        : widget.artObjects.length + 1;
    List<Widget> items = [];
    for (var i = 0; i < itemCount; i++) {
      final item = i >= widget.artObjects.length
          ? Container(
              margin: const EdgeInsets.only(top: 16),
              child: const ActivityIndicator(size: 24, strokeWidth: 1.5),
            )
          : ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350),
              child: GalleryListItem(
                artObject: widget.artObjects[i],
                onTap: widget.onItemTap,
              ),
            );
      items.add(item);
    }
    return items;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _scrollTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<GalleryBloc>().add(const GalleryFetched());
    }

    final bottomButtonVisibility = !_isTop &&
        _scrollController.position.userScrollDirection ==
            ScrollDirection.forward;

    if (_bottomButtonVisible != bottomButtonVisibility) {
      setState(() {
        _bottomButtonVisible = bottomButtonVisibility;
      });
    }
  }

  bool get _isTop {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll <= (maxScroll * 0.9);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
