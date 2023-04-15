import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_app_bar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final String version = "0.0.1";
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sobre",
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/Logo_medium_2.svg",
                  height: 55,
                  width: 250,
                  color: AppColors.primary,
                ),
                Text("Vagas de Flutter de forma simplificada!")
              ],
            )
          ],
        ),
      ),
    );
  }
}
