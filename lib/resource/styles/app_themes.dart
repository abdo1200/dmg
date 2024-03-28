import 'package:flutter/material.dart';

import 'app_colors.dart';

/// define custom themes here
final lightTheme = ThemeData(
  fontFamily: 'Co',
  scaffoldBackgroundColor: Colors.white,
  highlightColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    elevation: 0, // This removes the shadow from all App Bars.
  ),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Colors.white),
  badgeTheme: BadgeThemeData(backgroundColor: Colors.white),
  brightness: Brightness.light,
  splashColor: Colors.transparent,
)..addAppColor(
    AppThemeType.light,
    AppColors.defaultAppColor,
  );

final darkTheme = ThemeData(
  fontFamily: 'Co',
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Color(0xFF100F14),
  bottomNavigationBarTheme:
      BottomNavigationBarThemeData(backgroundColor: Color(0xFF100F14)),
  badgeTheme: BadgeThemeData(backgroundColor: Color(0xFF100F14)),
)..addAppColor(
    AppThemeType.dark,
    AppColors.darkThemeColor,
  );

enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.defaultAppColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();

  static late AppThemeType currentAppThemeType = AppThemeType.light;
}
