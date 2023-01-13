import 'package:art_gallery/shared/theme/theme.dart';
import 'package:flutter/widgets.dart';

class AppTheme extends InheritedWidget {
  final AppThemeData data;

  const AppTheme({super.key, required this.data, required super.child});

  @override
  bool updateShouldNotify(AppTheme oldWidget) {
    return oldWidget.data != data;
  }

  static AppThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!.data;
  }
}
