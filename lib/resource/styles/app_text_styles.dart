import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

class AppTextStyles {
  AppTextStyles._();

  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle =
      TextStyle(letterSpacing: _defaultLetterSpacing, fontFamily: 'Co'
          // height: 1.0,
          );
  static TextStyle s18BoldAppPrimary() => _baseTextStyle.merge(TextStyle(
      fontSize: 18.sp,
      color: AppColors.current.primaryColor,
      fontWeight: FontWeight.w700));
  static TextStyle s11Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.current.secondaryTextColor,
      ));
  static TextStyle s20Error() => _baseTextStyle.merge(TextStyle(
        fontSize: 20.sp,
        color: AppColors.current.errorTextColor,
      ));

  static TextStyle s13Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: AppColors.current.secondaryTextColor,
      ));

  static TextStyle s17Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.current.secondaryTextColor,
      ));
  static TextStyle s15Secondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.current.secondaryTextColor,
      ));

  static TextStyle s17Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.current.primaryTextColor,
      ));
  static TextStyle s11Primary({double hei = 1.75}) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.current.primaryTextColor,
        height: hei,
      ));

  static TextStyle s13White() => _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: AppColors.current.witheColor,
      ));
  static TextStyle s11White() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.current.witheColor,
      ));
  static TextStyle s11Black() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: Colors.black,
      ));
  static TextStyle s15White() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.current.witheColor,
      ));
  static TextStyle s17White() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.current.witheColor,
      ));
  static TextStyle s15Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s19Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 19.sp,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s20Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 20.sp,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s15AppSecondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.current.secondaryColor,
      ));

  static TextStyle s11AppSecondary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize: 11.sp,
          color: AppColors.current.secondaryColor,
          decoration: decoration));

  static TextStyle s13AppSecondary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize: 13.sp,
          color: AppColors.current.secondaryColor,
          decoration: decoration));
  static TextStyle s32BoldAppSecondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.current.secondaryColor,
      ));

  static TextStyle s17AppSecondary() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.current.secondaryColor,
      ));

  static TextStyle s13Primary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize: 13.sp,
          color: AppColors.current.primaryTextColor,
          decoration: decoration));
  static TextStyle s10Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 10.sp,
        color: AppColors.current.primaryTextColor,
      ));
  static TextStyle s16Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 16.sp,
        color: AppColors.current.primaryTextColor,
      ));
  static TextStyle s14Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 14.sp,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s28Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 28.sp,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s14Error() => _baseTextStyle.merge(TextStyle(
        fontSize: 14.sp,
        color: AppColors.current.errorTextColor,
      ));

  static TextStyle s34Primary() => _baseTextStyle.merge(TextStyle(
        fontSize: 34.sp,
        color: AppColors.current.primaryTextColor,
      ));

  static TextStyle s13AppPrimary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: AppColors.current.primaryColor,
        decoration: decoration,
      ));

  static TextStyle s17AppPrimary() => _baseTextStyle.merge(TextStyle(
        fontSize: 17.sp,
        color: AppColors.current.primaryColor,
      ));

  static TextStyle s15AppPrimary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: 15.sp,
        color: AppColors.current.primaryColor,
        decoration: decoration,
      ));
  static TextStyle s11AppPrimary(
          {TextDecoration decoration = TextDecoration.none}) =>
      _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.current.primaryColor,
        decoration: decoration,
      ));
  static TextStyle s16AppPrimary() => _baseTextStyle.merge(TextStyle(
        fontSize: 16.sp,
        color: AppColors.current.primaryColor,
      ));
  static TextStyle s16AppBoldPrimary() => _baseTextStyle.merge(TextStyle(
      fontSize: 16.sp,
      color: AppColors.current.primaryColor,
      fontWeight: FontWeight.bold));

  static TextStyle s13Black() => _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: AppColors.current.secondaryTextColor,
      ));
  static TextStyle s11Success() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: const Color(0xFF136616),
      ));
  static TextStyle s13Success() => _baseTextStyle.merge(TextStyle(
        fontSize: 13.sp,
        color: const Color(0xFF136616),
      ));
  static TextStyle s11Error() => _baseTextStyle.merge(TextStyle(
        fontSize: 11.sp,
        color: AppColors.current.errorTextColor,
      ));
}
