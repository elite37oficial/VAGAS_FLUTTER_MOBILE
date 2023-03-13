import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i => _instance ??= AppColors._();

  static Color get titleList => const Color(0XFF0D0D0D);
  static Color get neutral => const Color(0XFF545D69);
  static Color get greyBlue => const Color(0XFF387CA6);
  static Color get darkBlue => const Color(0XFF023E73);
  static Color get lightBlue => const Color(0XFF43BDD9);
  static Color get background => const Color(0XFF1E1E1E);
  static Color get typeJob => const Color(0XFF2EC221);
  static Color get grey => const Color(0XFFE4EDF2);
  static Color get greyLight => const Color(0XFFEBF2F6);
  static Color get black => const Color(0XFF000000);
  static Color get white => const Color(0XFFFFFFFF);
  static Color get red => const Color(0XFFF40000);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
