import 'package:flutter/material.dart';
import '/configs/themes/app_dark_theme.dart';

import '/configs/themes/ui_configs.dart';

class AppColors {

  static const kSecondaryColor = Color(0xFF8B94BC);
  static const kPrimaryColor = Color.fromARGB(255, 49, 61, 118);
  static const kGreenColor = Color(0xFF6AC259);
  static const kRedColor = Color(0xFFE92E30);
  static const kGrayColor = Color(0xFFC1C1C1);
  static const kBlackColor = Color(0xFF101010);
  static const kSaphireColor = Color.fromARGB(255, 38, 193, 217);
  static const kPrimaryGradient = LinearGradient(
    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );


  static const mainGradientDark = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [primaryDarkColorDark, primaryDarkColor],
  );
}

// LinearGradient mainGradient() => UIparameters.isDarkMode()
//     ? AppColors.mainGradientDark
//     : AppColors.mainGradientLight;

Color customScaffoldColor(BuildContext context) {
  return UIparameters.isDarkMode()
      ? const Color(0xFF2e3c62)
      : const Color.fromARGB(255, 240, 237, 255);
}
