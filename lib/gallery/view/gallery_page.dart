import 'package:art_gallery/art_details/art_details.dart';
import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:art_gallery/preferences/view/preferences_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, PreferencesPage.route());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: GalleryFilterChips(onFilterPickerToggle: () {
            context
                .read<GalleryFilterBloc>()
                .add(const GalleryFilterInitializationRequested());
            GalleryFilterPicker.show(context);
          }),
        ),
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
                      onItemTap: (item) =>
                          _navigateToArtObjectDetails(context, item),
                    );
                  case GalleryStatus.initial:
                  case GalleryStatus.loading:
                    return const ActivityIndicator();
                }
              },
            ),
          ],
        );
      }),
    );
  }

  void _navigateToArtObjectDetails(BuildContext context, ArtObject artObject) {
    final arguments = ArtDetailsArguments(
        title: artObject.longTitle,
        number: artObject.number,
        image: artObject.image);
    Navigator.push(context, ArtDetailsPage.route(arguments: arguments));
  }
}
