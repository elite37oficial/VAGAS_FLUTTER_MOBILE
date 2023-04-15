import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/model/dev_model.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';

class CustomDevelopersTopic extends StatelessWidget {
  final String title;
  final List<DevelopModel> developList;
  const CustomDevelopersTopic({
    Key? key,
    required this.title,
    required this.developList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          SvgPicture.asset("assets/images/linkedinIcon.svg"),
                          SizedBox(width: 12),
                          SvgPicture.asset("assets/images/gitHubIcon.svg")
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
