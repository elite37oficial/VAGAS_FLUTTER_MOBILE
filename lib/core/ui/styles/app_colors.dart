import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;
  AppColors._();

  static AppColors get i => _instance ??= AppColors._();

  static Color get appBar => const Color(0xff387ca6);
  static Color get cardJobTitle => const Color(0XFF142B3A);
  static Color get cardJobCompany => const Color(0XFF19384B);
  static Color get cardBorderLine => const Color(0XFFC1D6E3);
  static Color get cardDetail => const Color(0Xff8C8C8C);
  static Color get cardFilter => const Color(0XffA0A0A0);
  static Color get greyBlue => const Color(0XFF387CA6);
  static Color get grey => const Color(0XFFE4EDF2);
  static Color get white => const Color(0XFFFFFFFF);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
