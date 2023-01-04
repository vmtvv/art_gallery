import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const GalleryPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GalleryBloc(
              artCollectionRepository:
                  RepositoryProvider.of<ArtCollectionRepository>(context))
            ..add(const GalleryFilterChanged()),
        ),
        BlocProvider(
          create: (context) => GalleryFilterBloc(
              galleryBloc:
                  BlocProvider.of<GalleryBloc>(context, listen: false)),
        ),
      ],
      child: const GalleryView(),
    );
  }
}

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  GalleryViewState createState() {
    return GalleryViewState();
  }
}

class GalleryViewState extends State<GalleryView> {
  late double _filterPickerMinimizedPosition;
  late double _filterPickerMaximizedPosition;

  double _filterPickerPosition = 0.0;
  bool _filterPickerDisplayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            BlocBuilder<GalleryBloc, GalleryState>(
              builder: (context, state) {
                switch (state.status) {
                  case GalleryStatus.failure:
                    return GalleryError(
                      onRetry: () => context
                          .read<GalleryBloc>()
                          .add(const GalleryFetched()),
                    );
                  case GalleryStatus.success:
                    return GalleryList(
                      artObjects: state.artObjects,
                      hasReachedMax: state.hasReachedMax,
                      onItemTap: _navigateToArtObjectDetails,
                    );
                  case GalleryStatus.initial:
                  case GalleryStatus.loading:
                    return const ActivityIndicator();
                }
              },
            ),
            _buildFilterPicker(constraints.maxHeight),
            GalleryFilterChips(onFilterPickerToggle: () {
              if (!_filterPickerDisplayed) {
                context
                    .read<GalleryFilterBloc>()
                    .add(const GalleryFilterInitializationRequested());
              }
              setState(() {
                _filterPickerDisplayed = !_filterPickerDisplayed;
              });
            }),
          ],
        );
      }),
    );
  }

  void _navigateToArtObjectDetails(ArtObject artObject) {
    final arguments = ArtDetailsArguments(
        title: artObject.longTitle,
        number: artObject.number,
        image: artObject.image);
    Navigator.push(context, ArtDetailsPage.route(arguments: arguments));
  }

  Widget _buildFilterPicker(double maxHeight) {
    _initializeOrderBarPositions(maxHeight);

    _filterPickerPosition = _filterPickerDisplayed
        ? _filterPickerMaximizedPosition
        : _filterPickerMinimizedPosition;

    return AnimatedPositioned(
      top: _filterPickerPosition,
      duration: GalleryFilterPicker.transitionDuration,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GalleryFilterPicker(
          onClose: _toggleFilterPickerVisibility,
        ),
      ),
    );
  }

  void _initializeOrderBarPositions(double maxHeight) {
    _filterPickerMinimizedPosition = maxHeight;
    _filterPickerMaximizedPosition = maxHeight - GalleryFilterPicker.height;
  }

  void _toggleFilterPickerVisibility() {
    final position = _filterPickerDisplayed
        ? _filterPickerMinimizedPosition
        : _filterPickerMaximizedPosition;

    setState(() {
      _filterPickerDisplayed = !_filterPickerDisplayed;
      _filterPickerPosition = position;
    });
  }
}
