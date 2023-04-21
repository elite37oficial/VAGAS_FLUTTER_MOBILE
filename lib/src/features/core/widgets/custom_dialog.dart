import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';

import '../styles/app_colors.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 147,
        width: 334,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 56,
                width: 56,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
              Text("Enviando Denúncia...",
                  style: context.textStyles.textInterRegular.copyWith(
                    fontSize: 16,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
