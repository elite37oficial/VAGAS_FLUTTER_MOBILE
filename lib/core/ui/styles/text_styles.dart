import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/app_colors.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  String get fontLato => 'Lato';
  String get fontInter => 'Inter';
  String get fontSourceSansPro => 'SourceSansPro';

  static TextStyles get i => _instance ??= TextStyles._();

//======= LATO FONT =====================
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

//======= INTER FONT =====================
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
  TextStyle get textInterSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontInter,
      );

//======= SOURCE SANS PRO FONT =====================

  TextStyle get textSourceSansProLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontSourceSansPro,
      );

  TextStyle get textSourceSansProRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontSourceSansPro,
      );

  TextStyle get textSourceSansProSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontSourceSansPro,
      );

  TextStyle get textSourceSansProBold => TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: fontSourceSansPro,
      );

  TextStyle get textSourceSansProBlack => TextStyle(
        fontWeight: FontWeight.w900,
        fontFamily: fontSourceSansPro,
      );

  //*======= CARDS CONFIG =====================================

  TextStyle get textTitleCards => textInterSemiBold.copyWith(
        color: AppColors.darkBlue,
        fontSize: 18,
      );
  TextStyle get textTitleJobList => textInterSemiBold.copyWith(
        color: AppColors.titleList,
        fontSize: 18,
      );
  TextStyle get textCompanyJobList => textInterRegular.copyWith(
        color: AppColors.titleList.withOpacity(.5),
        fontSize: 11,
      );
  TextStyle get textCityTypeJobList => textSourceSansProRegular.copyWith(
        color: AppColors.neutral,
        fontSize: 9,
      );
  TextStyle get textValueJobList => textInterSemiBold.copyWith(
        color: AppColors.darkBlue,
        fontSize: 9,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
