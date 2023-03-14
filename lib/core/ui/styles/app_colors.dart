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
  static Color get greyLight => const Color(0XFFEBF2F6);
  static Color get grey500 => Colors.grey.shade500;
  static Color get black => const Color(0XFF000000);
  static Color get white => const Color(0XFFFFFFFF);
  static Color get red => const Color(0XFFF40000);
  static Color get greyBorderDetails => const Color(0XFfC1D6E3);
  static Color get greyTitle => const Color(0XFF142B3A);
}

extension AppColorsExtensions on BuildContext {
  AppColors get colors => AppColors.i;
}
