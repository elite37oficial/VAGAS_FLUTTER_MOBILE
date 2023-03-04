import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/app_colors.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  String get fontLato => 'lato';
  String get fontInter => 'inter';

  static TextStyles get i => _instance ??= TextStyles._();

  TextStyle get textLatoRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontLato,
      );

  TextStyle get textInterRegular => TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: fontInter,
      );
  TextStyle get textTitle => textInterRegular.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  TextStyle get textCompanyCard => textInterRegular.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 11,
      );
  TextStyle get textFooterCard => textInterRegular.copyWith(
        fontSize: 9,
        fontWeight: FontWeight.w400,
      );
  TextStyle get textFooterCardPrice => textInterRegular.copyWith(
        fontSize: 9,
        fontWeight: FontWeight.w600,
        color: AppColors.darkBlue,
      );
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
