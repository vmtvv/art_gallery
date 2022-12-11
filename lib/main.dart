import 'package:art_gallery/api/api.dart';
import 'package:art_gallery/app.dart';
import 'package:art_gallery/domain/domain.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider.value(
          value: AppLogger(),
        ),
        RepositoryProvider<ArtCollectionRepository>(
          create: (context) => ArtCollectionRepository(
            ApiServiceBuilder.createArtCollectionService(),
            Provider.of<AppLogger>(context, listen: false),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
