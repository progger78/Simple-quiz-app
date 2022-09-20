import 'package:flutter/material.dart';

import 'sub_theme_data_mixin.dart';

const Color primaryDarkColor = Color(0xFF99ace1);
const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: primaryDarkColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
