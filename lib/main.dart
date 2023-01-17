import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/app.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/gallery_filter/gallery_filter.dart';
import 'package:art_gallery/preferences/preferences.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService().initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeNotifier>(
          create: (_) => AppThemeNotifier(
            theme: AppThemeConfiguration.dark,
          ),
        ),
        Provider.value(
          value: AppLogger(),
        ),
        RepositoryProvider<domain.ArtCollectionRepository>(
          create: (context) => data.ArtCollectionRepository(
            data.ApiServiceBuilder.createArtCollectionService(),
            Provider.of<AppLogger>(context, listen: false),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PreferencesBloc(),
          ),
          BlocProvider(
            create: (context) => GalleryBloc(
                artCollectionRepository:
                    RepositoryProvider.of<domain.ArtCollectionRepository>(
                        context))
              ..add(const GalleryFilterChanged(
                  filter: domain.ArtCollectionFilter())),
          ),
          BlocProvider(
            create: (context) => GalleryFilterBloc(
                galleryBloc:
                    BlocProvider.of<GalleryBloc>(context, listen: false)),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
