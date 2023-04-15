import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/model/dev_model.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_app_bar.dart';

import '../../core/widgets/custom_developers_topic.dart';
import '../../core/widgets/custom_topic.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final String version = "0.0.1";
    final List<DevelopModel> developList = [
      DevelopModel(
        name: "Luan",
        atuation: "Backend",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Raquel",
        atuation: "Backend",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Guilherme",
        atuation: "Mobile",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Teófilo",
        atuation: "Mobile",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Wellyson Pontes",
        atuation: "Mobile",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Cauê",
        atuation: "Web",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Gustavo",
        atuation: "Web",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
      DevelopModel(
        name: "Francisco Cruz",
        atuation: "Design",
        linkedinUrl: "linkedinUrl",
        gitHubUrl: "gitHubUrl",
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sobre",
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: SvgPicture.asset(
                    "assets/images/Logo_medium.svg",
                    height: 55,
                    width: 250,
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  "Vagas de Flutter de forma simplificada!",
                  style: context.textStyles.textInterRegular
                      .copyWith(fontSize: 16, color: AppColors.darker),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTopic(
                    title: "Contato",
                    children: [
                      Text("Email: suporte@elite37.com.br"),
                      SizedBox(height: 12),
                      Text("Site da Elite: www.elite35.com.br"),
                    ],
                  ),
                  CustomTopic(
                    title: "Repositório",
                    children: [
                      Text("Link: github.com/elite37oficial"),
                    ],
                  ),
                  CustomTopic(
                    title: "Privacidade",
                    children: [
                      Text("Politica de privacidade e termos de uso"),
                    ],
                  ),
                  CustomTopic(
                    title: "Creditos",
                    children: [
                      CustomDevelopersTopic(
                        title: "Backend",
                        developList: developList
                            .where((list) => list.atuation.contains("Backend"))
                            .toList(),
                      ),
                      CustomDevelopersTopic(
                        title: "Mobile",
                        developList: developList
                            .where((list) => list.atuation.contains("Mobile"))
                            .toList(),
                      ),
                      CustomDevelopersTopic(
                        title: "Web",
                        developList: developList
                            .where((list) => list.atuation.contains("Web"))
                            .toList(),
                      ),
                      CustomDevelopersTopic(
                        title: "Design",
                        developList: developList
                            .where((list) => list.atuation.contains("Design"))
                            .toList(),
                      ),
                    ],
                  ),
                  CustomTopic(
                    title: "Versão",
                    children: [
                      Text(
                        version,
                        style: context.textStyles.textInterRegular.copyWith(
                          fontSize: 16,
                          color: AppColors.greyDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
