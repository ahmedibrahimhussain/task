import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../font_manager/font_manager.dart';

TextStyle _getTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
}) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle({
  Color color = Colors.white,
  double fontSize = 16,
}) {
  return _getTextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle getMediumStyle({
  Color color = Colors.white,
  double fontSize = 16,
}) {
  return _getTextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle getLightStyle({
  Color color = Colors.white,
  double fontSize = 16,
}) {
  return _getTextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle getBoldStyle({
  Color color = Colors.white,
  double fontSize = 16,
}) {
  return _getTextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}

TextStyle getSemiBoldStyle({
  Color color = Colors.white,
  double fontSize = 16,
}) {
  return _getTextStyle(
    fontSize: fontSize.sp,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}
