import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';

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

  TextStyle get textTitleCards => textInterRegular.copyWith(
        color: AppColors.cardJobTitle,
        fontSize: 18,
      );
  TextStyle get textFilterCards => textInterRegular.copyWith(
        color: AppColors.cardFilter,
        fontSize: 14,
      );
  TextStyle get textTitleJobList => textInterRegular.copyWith(
        color: AppColors.cardJobTitle,
        fontSize: 16,
      );
  TextStyle get textCompanyJobList => textInterRegular.copyWith(
        color: AppColors.cardJobCompany,
        fontSize: 12,
      );
  TextStyle get textCityTypeJobList => textSourceSansProRegular.copyWith(
        color: AppColors.cardDetail,
        fontSize: 10,
      );
  TextStyle get textTitleDetails => textLatoRegular.copyWith(
        color: AppColors.greyTitle,
        fontSize: 28,
      );
  TextStyle get textSubTitleDetails => textLatoRegular.copyWith(
        color: AppColors.greyTitle,
        fontSize: 18,
      );
  TextStyle get textDetails => textLatoRegular.copyWith(
        color: AppColors.greyTitle,
        fontSize: 16,
      );
  TextStyle get textCompanyDetails => textLatoRegular.copyWith(
        color: AppColors.greyTitle,
        fontSize: 24,
      );
  TextStyle get textEmphasisDetails => textLatoRegular.copyWith(
        color: AppColors.greyBlue,
        fontSize: 18,
      );
  TextStyle get textDenounceDetails => textInterRegular.copyWith(
        color: AppColors.greyBlue,
        fontSize: 16,
      );
  TextStyle get textNameAppSplash => textInterLight.copyWith(
        color: AppColors.greyBlue,
        fontSize: 36,
      );
  TextStyle get textFilter => textInterRegular.copyWith(
        color: AppColors.cardBorderLine,
        fontSize: 16,
      );
  TextStyle get textNameAppWelcomePage => textInterRegular.copyWith(
        color: AppColors.greyBlue,
        fontSize: 40,
      );
  TextStyle get textButtonWelcomePage => textInterRegular.copyWith(
        color: AppColors.white,
        fontSize: 18,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
