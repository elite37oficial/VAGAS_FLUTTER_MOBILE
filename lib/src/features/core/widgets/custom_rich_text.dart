import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import '../styles/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String? text;
  final String? url;
  final Function? onTap;
  const CustomRichText({
    Key? key,
    this.text,
    this.url,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: RichText(
        text: TextSpan(
          style: context.textStyles.textInterRegular.copyWith(
            color: AppColors.greyDark,
            fontSize: 16,
          ),
          children: [
            TextSpan(text: text != null ? "$text " : null),
            TextSpan(
              text: url,
              style: context.textStyles.textInterRegular
                  .copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
