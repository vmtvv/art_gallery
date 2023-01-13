part of 'preferences_bloc.dart';

abstract class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object> get props => [];
}

class PreferencesDarkModeChanged extends PreferencesEvent {
  const PreferencesDarkModeChanged(this.isDarkMode);

  final bool isDarkMode;

  @override
  List<Object> get props => [isDarkMode];
}
