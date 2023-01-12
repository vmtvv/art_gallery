import 'package:art_gallery/gallery/gallery.dart';
import 'package:art_gallery/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<AppThemeNotifier>(context);
    return AppTheme(
      data: themeNotifier.theme,
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: themeNotifier.getMaterialLightTheme(),
        darkTheme: themeNotifier.getMaterialDarkTheme(),
        themeMode: themeNotifier.theme.mode == AppThemeMode.light
            ? ThemeMode.light
            : ThemeMode.dark,
        home: const GalleryPage(),
      ),
    );
  }
}
