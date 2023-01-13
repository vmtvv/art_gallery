import 'package:art_gallery/shared/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemeNotifier with ChangeNotifier {
  AppThemeData _theme;

  AppThemeNotifier({
    required AppThemeData theme,
  }) : _theme = theme;

  AppThemeData get theme => _theme;

  setTheme(AppThemeData themeData) {
    _theme = themeData;
    notifyListeners();
  }
}
