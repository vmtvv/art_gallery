import 'dart:async';

import 'package:art_gallery/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

enum ArtDetailsStatus { initial, failure, success }

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(_createState(LocalStorageService().isDarkMode)) {
    on<PreferencesDarkModeChanged>(_onPreferencesDarkModeChanged);
  }

  Future<void> _onPreferencesDarkModeChanged(
    PreferencesDarkModeChanged event,
    Emitter<PreferencesState> emit,
  ) async {
    LocalStorageService().isDarkMode = event.isDarkMode;

    return emit(
      _createState(event.isDarkMode),
    );
  }

  static PreferencesState _createState(bool isDarkMode) {
    return PreferencesState(
      isDarkMode: isDarkMode,
      theme:
          isDarkMode ? AppThemeConfiguration.dark : AppThemeConfiguration.light,
    );
  }
}
