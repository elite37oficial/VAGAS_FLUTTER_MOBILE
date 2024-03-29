import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/routes/app_routes.dart';
import 'package:vagas_flutter_mobile/src/features/core/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/image_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4)).then((value) =>
        Navigator.of(context).pushReplacementNamed(AppRoutes.welcome));

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Spacer(),
                SvgPicture.asset(
                  context.image.logoApp,
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: context.textStyles.textInterLight.copyWith(
                          color: AppColors.primary,
                          fontSize: 36,
                        ),
                        children: const <TextSpan>[
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
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: context.percentWidth(0.6),
                  child: LinearProgressIndicator(
                    color: AppColors.primary,
                    backgroundColor: AppColors.lightHover,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Powered by',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'Elite37',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
