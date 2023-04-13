import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/constants/constant.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';
import '../../routes/app_routes.dart';

class CardWidget extends StatelessWidget {
  final String id;
  final HomeJobEntity homeJob;
  const CardWidget({
    Key? key,
    required this.id,
    required this.homeJob,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.jobDetail,
          arguments: id,
        );
        print(id);
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.only(bottom: 8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: AppColors.lightActive,
            ),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 48,
                width: 48,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    "${Constant.baseUrlCompaniesImage}/id/${homeJob.companyId}",
                    height: 48,
                    width: 48,
                    errorBuilder: (context, exception, stackTrace) {
                      return Image.asset(
                        "assets/images/avatarDefault.png",
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: context.sWidth - 140,
                height: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeJob.title,
                      style: context.textStyles.textInterRegular.copyWith(
                        color: AppColors.darker,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      homeJob.companyName,
                      style: context.textStyles.textInterRegular.copyWith(
                        color: AppColors.darkerActive,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              size: 12,
                              color: AppColors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              homeJob.city,
                              style: context.textStyles.textCityTypeJobList,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled_outlined,
                              size: 12,
                              color: AppColors.grey,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              homeJob.modality,
                              style: context.textStyles.textCityTypeJobList,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
