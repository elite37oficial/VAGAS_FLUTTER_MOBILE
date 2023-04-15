import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import '../styles/app_colors.dart';

class CustomCheckBoxButton extends StatelessWidget {
  final bool? wrapText;
  final bool? isSelect;

  final String text;
  const CustomCheckBoxButton({
    Key? key,
    this.wrapText,
    this.isSelect,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
            color: isSelect == true ? AppColors.active : null,
            border: Border.all(
              width: 1,
              color: AppColors.darker,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: isSelect == true
              ? Icon(
                  Icons.check,
                  weight: 8,
                  size: 15,
                  color: Colors.white,
                )
              : null,
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          width: wrapText == true ? context.sWidth - 70 : null,
          child: Text(
            text,
            style: context.textStyles.textFilter.copyWith(
              fontSize: 14,
              color: AppColors.darker,
            ),
          ),
        ),
      ],
    );
  }
}
