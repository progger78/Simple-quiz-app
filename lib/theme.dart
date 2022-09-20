import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configs/themes/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor:
        AppColors.kPrimaryColor, // TODO WORK ON GENERAL THEMING,
    appBarTheme: appBarTheme(),
    textTheme: getTextTheme(),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white, unselectedItemColor: Colors.white),
    inputDecorationTheme: inputDecoration(),
  );
}

InputDecorationTheme inputDecoration() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.kSecondaryColor, width: 2),
  );

  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    suffixIconColor: AppColors.kSecondaryColor.withOpacity(0.7),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: const EdgeInsets.all(20),
    labelStyle: const TextStyle(color: AppColors.kSecondaryColor, fontSize: 24),
    hintStyle: const TextStyle(color: AppColors.kSecondaryColor),
    alignLabelWithHint: false,
    enabledBorder: outlineInputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.kSecondaryColor)),
    errorStyle: const TextStyle(color: Colors.red, fontSize: 14),
    focusedBorder: outlineInputBorder.copyWith(
        borderSide:
            const BorderSide(color: AppColors.kSaphireColor, width: 1.5)),
    border: outlineInputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.kSecondaryColor)),
  );
}

TextTheme getTextTheme() {
  return GoogleFonts.quicksandTextTheme(
    const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.white, fontSize: 20)),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    
    elevation: 0,
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: Colors.white,
    actionsIconTheme: IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    ).titleLarge,
  );
}
