part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  const PreferencesState({
    required this.isDarkMode,
    required this.theme,
  });

  final bool isDarkMode;
  final AppThemeData theme;

  @override
  List<Object?> get props => [isDarkMode, theme];
}
