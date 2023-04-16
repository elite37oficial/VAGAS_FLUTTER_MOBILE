import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_developers/get_developers_usecase_imp.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_app_bar.dart';
import 'package:vagas_flutter_mobile/src/features/views/about/about_controller.dart';
import 'package:vagas_flutter_mobile/src/features/views/about/about_state.dart';

import '../../../data/datasource/get_developers/mock/get_developers_datasource_mock_imp.dart';
import '../../../data/repositories/get_developers/get_developers_repository_imp.dart';
import '../../core/widgets/custom_developers_topic.dart';
import '../../core/widgets/custom_rich_text.dart';
import '../../core/widgets/custom_topic.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final AboutController _aboutController = AboutController(
    GetDevelopersUseCaseImp(
      GetDevelopersRepositoryImp(
        GetDevelopersDataSourceMockImp(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _aboutController.getDevelopers();
  }

  @override
  Widget build(BuildContext context) {
    final String version = "0.0.1";
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sobre",
      ),
      body: ValueListenableBuilder(
        valueListenable: _aboutController,
        builder: (context, state, child) {
          if (state is EmptyDevelopersState) {
            return Center(
              child: Text("Sem informações sobre p aplicativo"),
            );
          }
          if (state is GetDevelopersState) {
            final developList = state.listDevelopers;
            return Container(
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
                            CustomRichText(
                              text: "Email:",
                              url: "suporte@elite37.com.br",
                            ),
                            SizedBox(height: 12),
                            CustomRichText(
                              text: "Site",
                              url: "www.elite37.com.br",
                              onTap: () => _aboutController
                                  .openLink("http://www.elite37.com.br"),
                            )
                          ],
                        ),
                        CustomTopic(
                          title: "Repositório",
                          children: [
                            CustomRichText(
                              text: "Link:",
                              url: "github.com/elite37oficial",
                              onTap: () => _aboutController
                                  .openLink("http://github.com/elite37oficial"),
                            ),
                          ],
                        ),
                        CustomTopic(
                          title: "Privacidade",
                          children: [
                            CustomRichText(
                                url: "Politica de privacidade e termos de uso")
                          ],
                        ),
                        CustomTopic(
                          title: "Creditos",
                          children: [
                            CustomDevelopersTopic(
                              title: "Backend",
                              developList: developList
                                  .where((list) =>
                                      list.atuation.contains("Backend"))
                                  .toList(),
                            ),
                            CustomDevelopersTopic(
                              title: "Mobile",
                              developList: developList
                                  .where((list) =>
                                      list.atuation.contains("Mobile"))
                                  .toList(),
                            ),
                            CustomDevelopersTopic(
                              title: "Web",
                              developList: developList
                                  .where(
                                      (list) => list.atuation.contains("Web"))
                                  .toList(),
                            ),
                            CustomDevelopersTopic(
                              title: "Design",
                              developList: developList
                                  .where((list) =>
                                      list.atuation.contains("Design"))
                                  .toList(),
                            ),
                          ],
                        ),
                        CustomTopic(
                          title: "Versão",
                          children: [
                            CustomRichText(
                              text: version,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
