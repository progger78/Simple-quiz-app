class AppConstants {
  static const String appName = 'food_delivery';
  static const int appVersion = 1;

  static const kAnimationDuration = Duration(milliseconds: 200);
  static const defaultDuration = Duration(milliseconds: 250);
  static const double kDefaultPadding = 20.0;

// Form Error
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp passwordValidatorRedExp = RegExp(
    "^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[@\$!%*?&])[A-Za-zd@\$!%*?&]{8,}\$");
const String kEmailNullError = "Пожалуйста, введите Вашу почту";
const String kInvalidEmailError = "Пожалуйста, введите верную почту";
const String kInvalidPasswordError = "Пожалуйста, введите верный пароль";
const String kPassNullError = "Пожалуйста, введите Ваш пароль";
const String kShortPassError = "Пароль должен быть минимум 8 символов";
const String kMatchPassError = "Пароли не совпадают";
const String kNamelNullError = "Пожалуйста, введите Ваше имя";
const String kLastNamelNullError = "Пожалуйста, введите Вашу фамилию";
const String kPhoneNumberNullError = "Пожалуйста, введите Ваш номер телефона";
const String kCountryNullError = "Пожалуйста, введите Вашe страну";
const String kCityNullError = "Пожалуйста, введите Ваш город";
const String kInvalidAgeError = "Пожалуйста, введите Ваш возраст";
const String kAgeNullError = "Возраст должен быть больше 0";
