import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  String get fontLato => 'lato';
  String get fontInter => 'inter';

  static TextStyles get i => _instance ??= TextStyles._();

  TextStyle get textLatoThin => TextStyle(
        fontWeight: FontWeight.w100,
        fontFamily: fontLato,
      );

  TextStyle get textLatoLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontLato,
      );

  TextStyle get textLatoRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontLato,
      );

  TextStyle get textLatoBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: fontLato,
      );

  TextStyle get textLatoBlack => TextStyle(
        fontWeight: FontWeight.w900,
        fontFamily: fontLato,
      );

  TextStyle get textInterThin => TextStyle(
        fontWeight: FontWeight.w100,
        fontFamily: fontInter,
      );
  TextStyle get textInterLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontInter,
      );

  TextStyle get textInterRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontInter,
      );
  TextStyle get textInterMedium => TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: fontInter,
      );

  TextStyle get textInterSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontInter,
      );

  TextStyle get textInterBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: fontInter,
      );
  TextStyle get textInterExtraBold => TextStyle(
        fontWeight: FontWeight.w800,
        fontFamily: fontInter,
      );

  TextStyle get textInterBlack => TextStyle(
        fontWeight: FontWeight.w900,
        fontFamily: fontInter,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
