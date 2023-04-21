import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/routes/app_routes.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';

class CustomDialogButton extends StatelessWidget {
  final bool isSucess;
  const CustomDialogButton({
    Key? key,
    required this.isSucess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: isSucess ? 250 : 289,
        width: 334,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            SvgPicture.asset(
              isSucess == true
                  ? "assets/images/sucessReport.svg"
                  : "assets/images/failReport.svg",
              height: 64,
              width: 64,
            ),
            const SizedBox(height: 16),
            Text(
              isSucess == true
                  ? "Denúncia enviada com sucesso!"
                  : "Falha ao enviar",
              style: context.textStyles.textInterMedium.copyWith(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            if (isSucess == false) const SizedBox(height: 24),
            if (isSucess == false)
              Text(
                "Falha ao enviar denúncia, por favor tente novamente.",
                style: context.textStyles.textInterRegular.copyWith(
                  color: AppColors.greyDark,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 32),
            Container(
              height: 51,
              width: 302,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary),
                color: isSucess == true ? AppColors.white : AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    isSucess == true ? AppRoutes.home : AppRoutes.jobDetail,
                    (route) => false,
                  );
                },
                child: Text(
                  isSucess == true ? "Ir para início" : "Tentar novamente",
                  style: context.textStyles.textInterBold.copyWith(
                    color:
                        isSucess == true ? AppColors.primary : AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
