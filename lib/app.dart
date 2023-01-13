import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/preferences/preferences.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
        builder: (context, state) {
      return AppTheme(
        data: state.theme,
        child: MaterialApp(
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: state.theme.getMaterialLight(),
          darkTheme: state.theme.getMaterialDark(),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const GalleryPage(),
        ),
      );
    });
  }
}
