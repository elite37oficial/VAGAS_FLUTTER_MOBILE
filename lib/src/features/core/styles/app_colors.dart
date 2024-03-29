import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i => _instance ??= AppColors._();
  static Color get primary => const Color(0XFF387CA6);
  static Color get white => const Color(0XFFFFFFFF);
  static Color get black => const Color(0XFF000000);
  static Color get darker => const Color(0XFF142B3A);
  static Color get lightActive => const Color(0XFFC1D6E3);
  static Color get darkerActive => const Color(0XFF19384B);
  static Color get active => const Color(0XFF2D6385);
  static Color get grey500 => const Color(0XffA0A0A0);
  static Color get grey => const Color(0Xff8C8C8C);
  static Color get greyLight => const Color(0Xff787878);
  static Color get greyDark => const Color(0Xff383838);
  static Color get light => const Color(0XFFEBF2F6);
  static Color get lightPrimary => const Color(0XFF98A8B2);
  static Color get lightHover => const Color(0XFFE1EBF2);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
