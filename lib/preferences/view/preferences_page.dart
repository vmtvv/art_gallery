import 'package:art_gallery/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PreferencesPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.preferences_title),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          child: Column(
            children: const [
              DarkModeSwitch(),
            ],
          ),
        ),
      ),
    );
  }
}
