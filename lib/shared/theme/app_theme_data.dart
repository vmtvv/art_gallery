import 'package:flutter/material.dart';

enum AppThemeMode { light, dark }

class AppThemeData {
  final AppThemeMode mode;

  final Color primaryColor;
  final Color onPrimaryColor;

  final Color? primaryVariantColor;
  final Color? onPrimaryVariantColor;

  final Color? secondaryColor;
  final Color? onSecondaryColor;

  final Color? tertiaryColor;
  final Color? onTertiaryColor;

  final Color? heroColor;
  final Color? onHeroColor;

  final Color backgroundColor;
  final Color onBackgroundColor;

  final Color surfaceColor;
  final Color onSurfaceColor;
  final Color onSurfaceSecondaryColor;

  final Color disablingColor;
  final Color onDisablingColor;

  final Color errorColor;
  final Color onErrorColor;

  final Color successColor;
  final Color onSuccessColor;

  final Color? miscColor;
  final Color? onMiscColor;

  final Color dividerColor;

  AppThemeData(
      {required this.mode,
      required this.primaryColor,
      required this.onPrimaryColor,
      required this.backgroundColor,
      required this.onBackgroundColor,
      required this.surfaceColor,
      required this.onSurfaceColor,
      required this.onSurfaceSecondaryColor,
      required this.errorColor,
      required this.onErrorColor,
      required this.successColor,
      required this.onSuccessColor,
      required this.dividerColor,
      required this.disablingColor,
      required this.onDisablingColor,
      this.primaryVariantColor,
      this.onPrimaryVariantColor,
      this.secondaryColor,
      this.onSecondaryColor,
      this.tertiaryColor,
      this.onTertiaryColor,
      this.heroColor,
      this.onHeroColor,
      this.miscColor,
      this.onMiscColor});
}
