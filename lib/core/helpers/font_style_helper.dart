import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_weight_helper.dart';

abstract class AppTextStyleHelper{
  static TextStyle font62WhiteExtraBold = TextStyle(
    fontSize: 62.sp,
    fontWeight: AppFontWeightHelper.extraBold,
    color: Colors.white,
    fontFamily: 'Zain',
  );

  static TextStyle font28PurpleBold = TextStyle(
    fontSize: 28.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColorHelper.primaryColor,
    fontFamily: 'Zain',
  );

  static TextStyle font26PurpleBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColorHelper.primaryColor,
    fontFamily: 'Zain',
  );

  static TextStyle font22PurpleBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColorHelper.primaryColor,
    fontFamily: 'Zain',
  );

  static TextStyle font22DarkGreyBold = TextStyle(
    fontSize: 22.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColorHelper.darkGreyColor,
    fontFamily: 'Zain',
  );

  static TextStyle font26BlackBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: Colors.black,
    fontFamily: 'Zain',
  );

  static TextStyle font26GrayBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: Colors.grey,
    fontFamily: 'Zain',
  );

  static TextStyle font26BlackMedium = TextStyle(
    fontSize: 26.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: Colors.black,
    fontFamily: 'Zain',
  );

  static TextStyle font26WhiteBold = TextStyle(
    fontSize: 26.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColorHelper.whiteColor,
    fontFamily: 'Zain',
  );

}