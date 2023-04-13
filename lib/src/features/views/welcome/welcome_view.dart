import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/routes/app_routes.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/helpers/size_extensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import '../../core/ui/styles/app_colors.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: context.percentHeight(.17),
            bottom: context.percentHeight(.065),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Vagas de Flutter de forma\n"
                "simplificada!",
                textAlign: TextAlign.center,
                style: context.textStyles.textButtonWelcomePage.copyWith(
                  fontSize: 24,
                  color: AppColors.primary,
                ),
              ),
              SvgPicture.asset(
                'assets/images/logo_small.svg',
                height: 200,
                width: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: context.textStyles.textInterRegular.copyWith(
                        color: AppColors.primary,
                        fontSize: 40,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Elite',
                        ),
                        TextSpan(
                          text: ' Vagas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: context.percentWidth(.8),
                height: context.percentHeight(.06),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.primary,
                    fixedSize: const Size(300, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Encontrar sua vaga',
                    style: context.textStyles.textButtonWelcomePage,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
