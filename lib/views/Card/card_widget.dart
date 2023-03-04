import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/models/job_model.dart';

class CardWidget extends StatelessWidget {
  final JobModel job;

  const CardWidget({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size medida = MediaQuery.of(context).size;
    return SizedBox(
      height: medida.height * 0.10,
      width: medida.width * 0.8,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: AppColors.grey,
          ),
        ),
        child: Row(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 48,
                width: 48,
                child: Image.network(
                  job.imageUrl,
                  height: 48,
                  width: 48,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job.jobOportunity,
                style: context.textStyles.textTitle,
              ),
              Text(job.company, style: context.textStyles.textCompanyCard),
              Row(
                children: [
                  Text(
                    "${job.city} - ",
                    style: context.textStyles.textFooterCard,
                  ),
                  Text(
                    "${job.jobType} - ",
                    style: context.textStyles.textFooterCard,
                  ),
                  Text(
                    "R\$ ${job.value}",
                    style: context.textStyles.textFooterCardPrice,
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
