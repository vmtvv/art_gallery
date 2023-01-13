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

  late double _bottomButtonHiddenPosition;
  late double _bottomButtonVisiblePosition;

  bool _bottomButtonVisible = false;
  double _bottomButtonPosition = 0.0;

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
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= widget.artObjects.length
                    ? Container(
                        margin: const EdgeInsets.only(top: 16),
                        child:
                            const ActivityIndicator(size: 24, strokeWidth: 1.5),
                      )
                    : GalleryListItem(
                        artObject: widget.artObjects[index],
                        onTap: widget.onItemTap,
                      );
              },
              itemCount: widget.hasReachedMax
                  ? widget.artObjects.length
                  : widget.artObjects.length + 1,
              controller: _scrollController,
            ),
          ),
          _buildBottomButton(
              context, constraints.maxHeight, constraints.maxWidth),
        ],
      );
    });
  }

  Widget _buildBottomButton(
      BuildContext context, double maxHeight, double maxWidth) {
    _initializeBottomButtonPositions(maxHeight);

    _bottomButtonPosition = _bottomButtonVisible
        ? _bottomButtonVisiblePosition
        : _bottomButtonHiddenPosition;

    return AnimatedPositioned(
      top: _bottomButtonPosition,
      duration: const Duration(milliseconds: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: ElevatedButton.icon(
            onPressed: _scrollTop,
            icon: const Icon(Icons.keyboard_arrow_up_rounded),
            label:
                Text(AppLocalizations.of(context)!.gallery_list_bottom_button),
          ),
        ),
      ),
    );
  }

  void _initializeBottomButtonPositions(double maxHeight) {
    _bottomButtonHiddenPosition = maxHeight;
    _bottomButtonVisiblePosition = maxHeight - 80;
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
      final position = _bottomButtonVisible
          ? _bottomButtonVisiblePosition
          : _bottomButtonHiddenPosition;

      setState(() {
        _bottomButtonVisible = bottomButtonVisibility;
        _bottomButtonPosition = position;
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
