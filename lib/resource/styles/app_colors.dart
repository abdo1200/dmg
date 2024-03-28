import 'package:clean_arc/resource/styles/app_themes.dart';
import 'package:flutter/material.dart';

class AppColors {
  const AppColors(
      {required this.editTextColor,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primaryTextColor,
      required this.secondaryTextColor,
      required this.primaryGradient,
      required this.errorTextColor,
      required this.dialogBackColor,
      required this.witheColor,
      required this.dialogColor});

  static late AppColors current;

  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color errorTextColor;
  final Color dialogBackColor;
  final Color witheColor;
  final Color dialogColor;
  final Color editTextColor;

  /// gradient
  final LinearGradient primaryGradient;

  static const defaultAppColor = AppColors(
      primaryColor: Color(0xFF2C1D65),
      secondaryColor: Color(0xFFE30D73),
      primaryTextColor: Color(0xFF101010),
      secondaryTextColor: Color(0xFF737373),
      editTextColor: Color.fromRGBO(236, 236, 236, 1),
      primaryGradient:
          LinearGradient(colors: [Color(0xFFE30D73), Color(0xFF2C1D65)]),
      errorTextColor: Color(0xFFAF0303),
      dialogBackColor: Color(0xff10101040),
      witheColor: Color(0xFFFFFFFF),
      dialogColor: Color.fromRGBO(26, 24, 23, 0.16));

  static const darkThemeColor = AppColors(
      primaryColor: Color(0xFF2C1D65),
      secondaryColor: Color(0xFFE30D73),
      primaryTextColor: Color(0xFF8F8F8F),
      //      primaryTextColor: Color(0xFF101010),
      secondaryTextColor: Color(0xFFB6B6B6),
      editTextColor: Color.fromRGBO(236, 236, 236, 1),
      primaryGradient:
          LinearGradient(colors: [Color(0xFF00FFFF), Color(0xFF05A5B1)]),
      errorTextColor: Color(0xFFAF0303),
      dialogBackColor: Color(0xff10101040),
      witheColor: Color(0xFFFFFFFF),
      dialogColor: Color.fromRGBO(26, 24, 23, 0.16));

  static AppColors of(BuildContext context) {
    final appColor = Theme.of(context).appColor;

    current = appColor;

    return current;
  }

  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? editTextColor,
    LinearGradient? primaryGradient,
    Color? errorTextColor,
    Color? dialogBackColor,
    Color? witheColor,
    Color? dialogColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      editTextColor: editTextColor ?? this.editTextColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      errorTextColor: errorTextColor ?? this.errorTextColor,
      dialogBackColor: dialogBackColor ?? this.dialogBackColor,
      witheColor: witheColor ?? this.witheColor,
      dialogColor: dialogColor ?? this.dialogColor,
    );
  }
}
