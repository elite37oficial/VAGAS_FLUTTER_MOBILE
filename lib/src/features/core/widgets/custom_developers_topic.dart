import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/views/about/about_controller.dart';
import '../../../data/datasource/get_developers/mock/get_developers_datasource_mock_imp.dart';
import '../../../data/repositories/get_developers/get_developers_repository_imp.dart';
import '../../../domain/entities/develop_emtity.dart';
import '../../../domain/usecases/get_developers/get_developers_usecase_imp.dart';

class CustomDevelopersTopic extends StatelessWidget {
  final String title;
  final List<DevelopEntity> developList;
  final bool? openUrl;
  const CustomDevelopersTopic({
    Key? key,
    required this.title,
    required this.developList,
    this.openUrl = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AboutController _aboutController = AboutController(
      GetDevelopersUseCaseImp(
        GetDevelopersRepositoryImp(
          GetDevelopersDataSourceMockImp(),
        ),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: context.textStyles.textInterRegular
              .copyWith(fontSize: 16, color: AppColors.darker),
        ),
        SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: developList.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        developList[index].name,
                        style: context.textStyles.textInterRegular.copyWith(
                          fontSize: 16,
                          color: AppColors.greyDark,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: openUrl != null
                                ? () => _aboutController
                                    .openLink(developList[index].linkedinUrl)
                                : null,
                            child: SvgPicture.asset(
                                "assets/images/linkedinIcon.svg"),
                          ),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: openUrl != null
                                ? () => _aboutController
                                    .openLink(developList[index].gitHubUrl)
                                : null,
                            child: SvgPicture.asset(
                                "assets/images/gitHubIcon.svg"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(height: 1),
              ],
            );
          },
        )
      ],
    );
  }
}
