import 'package:flutter/painting.dart';

class AppThemeTextStyles {
  static const String _primaryFontFamily = 'Filsonsoft';
  static const String _secondaryFontFamily = 'Charleston';

  static Function(Color) titleH1 =
      (Color color) => _textStyle(_primaryFontFamily, 54, FontWeight.w500, color);

  static Function(Color) titleH2 =
      (Color color) => _textStyle(_primaryFontFamily, 46, FontWeight.w500, color);

  static Function(Color) titleH3 =
      (Color color) => _textStyle(_primaryFontFamily, 30, FontWeight.w700, color);

  static Function(Color) titleH4 =
      (Color color) => _textStyle(_secondaryFontFamily, 30, FontWeight.w400, color);

  static Function(Color) titleH5 =
      (Color color) => _textStyle(_primaryFontFamily, 22, FontWeight.w500, color);

  static Function(Color) titleH6 =
      (Color color) => _textStyle(_primaryFontFamily, 18, FontWeight.w500, color);

  static Function(Color) subtitle1 =
      (Color color) => _textStyle(_primaryFontFamily, 16, FontWeight.w500, color);

  static Function(Color) subtitle2 =
      (Color color) => _textStyle(_primaryFontFamily, 14, FontWeight.w500, color);

  static Function(Color) header =
      (Color color) => _textStyle(_primaryFontFamily, 36, FontWeight.w500, color);

  static Function(Color) pageHeader =
      (Color color) => _textStyle(_primaryFontFamily, 30, FontWeight.w500, color);

  static Function(Color) subtitle =
      (Color color) => _textStyle(_primaryFontFamily, 22, FontWeight.w700, color);

  static Function(Color) headline =
      (Color color) => _textStyle(_primaryFontFamily, 18, FontWeight.w700, color);

  static Function(Color) subheader =
      (Color color) => _textStyle(_primaryFontFamily, 12, FontWeight.w400, color);

  static Function(Color) body1 =
      (Color color) => _textStyle(_primaryFontFamily, 16, FontWeight.w300, color);

  static Function(Color) body2 =
      (Color color) => _textStyle(_primaryFontFamily, 14, FontWeight.w300, color);

  static Function(Color) body3 =
      (Color color) => _textStyle(_primaryFontFamily, 12, FontWeight.w300, color);

  static Function(Color) button =
      (Color color) => _textStyle(_primaryFontFamily, 16, FontWeight.w500, color);

  static Function(Color) caption =
      (Color color) => _textStyle(_primaryFontFamily, 12, FontWeight.w500, color);

  static Function(Color) eyebrow =
      (Color color) => _textStyle(_primaryFontFamily, 12, FontWeight.w500, color);

  static TextStyle _textStyle(
      String fontFamily, double size, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: fontWeight,
        color: color);
  }
}
