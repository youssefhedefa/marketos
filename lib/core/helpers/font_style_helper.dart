import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_weight_helper.dart';

abstract class AppFontStyleHelper{
  static const TextStyle font62WhiteExtraBold = TextStyle(
    fontSize: 62,
    fontWeight: AppFontWeightHelper.extraBold,
    color: Colors.white,
    fontFamily: 'Zain',
  );

  static const TextStyle font24PurpleRegular = TextStyle(
    fontSize: 28,
    fontWeight: AppFontWeightHelper.bold,
    color: Color(0xff5D57EB),
    fontFamily: 'Zain',
  );
}