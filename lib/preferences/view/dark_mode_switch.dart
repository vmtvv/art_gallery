import 'package:art_gallery/preferences/bloc/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.preferences_dark_mode_label),
        BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: ((context, state) {
          return Switch(
            value: state.isDarkMode,
            onChanged: (value) {
              context
                  .read<PreferencesBloc>()
                  .add(PreferencesDarkModeChanged(value));
            },
          );
        })),
      ],
    );
  }
}
