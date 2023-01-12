import 'package:art_gallery/data/data.dart' as data;
import 'package:art_gallery/app.dart';
import 'package:art_gallery/domain/domain.dart' as domain;
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
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
      child: const App(),
    ),
  );
}
