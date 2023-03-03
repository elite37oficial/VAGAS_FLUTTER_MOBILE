import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i => _instance ??= AppColors._();

  static Color get titleList => const Color(0XFF0D0D0D);
  static Color get jobCityType => const Color(0XFF0D0D0D);
  static Color get greyBlue => const Color(0XFF387CA6);
  static Color get darkBlue => const Color(0XFF023E73);
  static Color get grey => const Color(0XFFE4EDF2);
  static Color get lightBlue => const Color(0XFF43BDD9);
  static Color get background => const Color(0XFF1E1E1E);
  static Color get black => const Color(0XFF0D0D0D);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
