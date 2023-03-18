import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';

import '../../../views/job_details/job_details_view.dart';
import '../../routes/app_routes.dart';

class CardWidget extends StatelessWidget {
  final JobEntity job;
  const CardWidget({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.jobDetail,
          arguments: job,
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: AppColors.cardBorderLine,
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
                    job.imageUrl,
                    height: 48,
                    width: 48,
                  ),
                ),
              ),
              SizedBox(
                height: 56,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.oportunity,
                      style: context.textStyles.textTitleJobList,
                    ),
                    Text(
                      job.company,
                      style: context.textStyles.textCompanyJobList,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              size: 12,
                              color: AppColors.cardDetail,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              job.city,
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
                              color: AppColors.cardDetail,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              job.type,
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
