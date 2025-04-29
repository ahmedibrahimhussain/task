import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';
import '../styles_manger/styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    drawerTheme: const DrawerThemeData(
        backgroundColor: ColorManager.scaffoldBackGroundColor),
    primaryColor: ColorManager.primary,
    scaffoldBackgroundColor: ColorManager.scaffoldBackGroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 26,
      ),
      color: ColorManager.scaffoldBackGroundColor,
      shadowColor: ColorManager.shadowColor,
      elevation: 2,
      titleTextStyle: getRegularStyle(
        color: ColorManager.black,
        fontSize: 16,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
