import 'package:art_gallery/shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemeNotifier with ChangeNotifier {
  AppThemeData _theme;

  AppThemeNotifier({
    required AppThemeData theme,
  }) : _theme = theme;

  AppThemeData get theme => _theme;

  CupertinoThemeData getCupertinoTheme() {
    return CupertinoThemeData(
      primaryColor: _theme.primaryColor,
      barBackgroundColor: _theme.surfaceColor,
      scaffoldBackgroundColor: _theme.backgroundColor,
      textTheme: CupertinoTextThemeData(
        textStyle: AppThemeTextStyles.body1(_theme.onBackgroundColor),
        actionTextStyle: AppThemeTextStyles.button(_theme.onSurfaceColor),
      ),
    );
  }

  ThemeData getMaterialLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _theme.primaryColor,
    );
  }

  ThemeData getMaterialDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _theme.primaryColor,
      brightness: Brightness.dark,
    );
  }

  setTheme(AppThemeData themeData) {
    _theme = themeData;
    notifyListeners();
  }
}
