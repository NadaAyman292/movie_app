import 'package:flutter/material.dart';
import 'package:movie_app/core/theming/colors.dart';
import 'package:movie_app/core/theming/styles.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyles.font8yellow400Weight,
      unselectedLabelStyle: TextStyles.font8grey400Weight,
      backgroundColor: MyColor.bkGroundBottomNavColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: MyColor.yellowColor,
      unselectedItemColor: MyColor.bottomNavIconColor,
      showUnselectedLabels: true,
    ),
  );
}
