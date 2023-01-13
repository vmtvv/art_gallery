import 'package:art_gallery/shared/theme/theme.dart';

class AppThemeConfiguration {
  static final light = AppThemeData(
    primaryColor: AppThemeColors.peach,
    onPrimaryColor: AppThemeColors.white,
    backgroundColor: AppThemeColors.white,
    onBackgroundColor: AppThemeColors.black,
    surfaceColor: AppThemeColors.white,
    onSurfaceColor: AppThemeColors.black,
    onSurfaceSecondaryColor: AppThemeColors.midGray,
    errorColor: AppThemeColors.red,
    onErrorColor: AppThemeColors.white,
    successColor: AppThemeColors.green,
    onSuccessColor: AppThemeColors.white,
    dividerColor: AppThemeColors.lightGray,
    disablingColor: AppThemeColors.lightGray,
    onDisablingColor: AppThemeColors.white,
  );

  static final dark = AppThemeData(
    primaryColor: AppThemeColors.peach,
    onPrimaryColor: AppThemeColors.white,
    backgroundColor: AppThemeColors.ebony,
    onBackgroundColor: AppThemeColors.white,
    surfaceColor: AppThemeColors.ebonyClay,
    onSurfaceColor: AppThemeColors.white,
    onSurfaceSecondaryColor: AppThemeColors.midGray,
    errorColor: AppThemeColors.red,
    onErrorColor: AppThemeColors.white,
    successColor: AppThemeColors.green,
    onSuccessColor: AppThemeColors.white,
    dividerColor: AppThemeColors.lightGray,
    disablingColor: AppThemeColors.lightGray,
    onDisablingColor: AppThemeColors.white,
  );
}
