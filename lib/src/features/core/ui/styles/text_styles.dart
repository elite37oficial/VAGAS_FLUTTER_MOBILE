import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  String get fontInter => 'Inter';
  String get fontLato => 'Lato';
  String get fontSourceSansPro => 'SourceSansPro';

  static TextStyles get i => _instance ??= TextStyles._();

  TextStyle get textInterLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontInter,
      );

  TextStyle get textInterRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontInter,
      );

  TextStyle get textLatoRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontLato,
      );

  TextStyle get textSourceSansProRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontSourceSansPro,
      );

  TextStyle get textCityTypeJobList => textSourceSansProRegular.copyWith(
        color: AppColors.grey,
        fontSize: 10,
      );

  TextStyle get textSubTitleDetails => textLatoRegular.copyWith(
        color: AppColors.darker,
        fontSize: 18,
      );
  TextStyle get textDetails => textLatoRegular.copyWith(
        color: AppColors.darker,
        fontSize: 16,
      );

  TextStyle get textEmphasisDetails => textLatoRegular.copyWith(
        color: AppColors.primary,
        fontSize: 18,
      );

  TextStyle get textFilter => textInterRegular.copyWith(
        color: AppColors.lightActive,
        fontSize: 16,
      );

  TextStyle get textButtonWelcomePage => textInterRegular.copyWith(
        color: AppColors.white,
        fontSize: 18,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
