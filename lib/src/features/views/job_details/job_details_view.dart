import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/image_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_app_bar.dart';
import '../../core/ui/styles/app_colors.dart';

class JobDetailsView extends StatelessWidget {
  final JobEntity listJobs;
  const JobDetailsView({
    Key? key,
    required this.listJobs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Detalhes da vaga"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 25,
              right: 24.0,
              left: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listJobs.oportunity,
                  style: context.textStyles.textTitleDetails,
                ),
                customTextColumnInformation(
                  text: listJobs.company,
                  textStyle: context.textStyles.textEmphasisDetails.copyWith(
                    color: AppColors.grey500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 32.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.greyBlue,
                          ),
                          customTextColumnInformation(
                            text: " ${listJobs.city} - ",
                            textStyle: context.textStyles.textEmphasisDetails,
                          ),
                          customTextColumnInformation(
                            text: listJobs.modality,
                            textStyle: context.textStyles.textEmphasisDetails,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.business_center,
                            color: AppColors.greyBlue,
                          ),
                          customTextColumnInformation(
                            text: ' ${listJobs.type} - ',
                            textStyle: context.textStyles.textEmphasisDetails,
                          ),
                          customTextColumnInformation(
                            text: listJobs.seniority,
                            textStyle: context.textStyles.textEmphasisDetails,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                        bottom: 20,
                      ),
                      child: Text(
                        'Entre em contato:',
                        style: context.textStyles.textSubTitleDetails,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        contactButton(
                          context: context,
                          svgAsset: context.image.linkContact,
                        ),
                        contactButton(
                          isWhatsApp: true,
                          context: context,
                          svgAsset: context.image.whatsAppContact,
                        ),
                        contactButton(
                          context: context,
                          svgAsset: context.image.emailContact,
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 35,
                    bottom: 16,
                  ),
                  child: Text(
                    'Sobre a vaga',
                    style: context.textStyles.textSubTitleDetails,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 25,
                  ),
                  child: Text(
                    listJobs.description,
                    style: context.textStyles.textDetails,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sobre a empresa',
                          style: context.textStyles.textSubTitleDetails,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 28,
                                bottom: 16,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        listJobs.imageUrl,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    listJobs.company,
                                    style:
                                        context.textStyles.textCompanyDetails,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              listJobs.aboutCompany,
                              style: context.textStyles.textDetails,
                              textAlign: TextAlign.justify,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 25,
                  ),
                  child: Center(
                    child: InkWell(
                      splashColor: AppColors.white,
                      onTap: () {},
                      child: Text(
                        'Denunciar essa vaga',
                        style: context.textStyles.textDenounceDetails,
                      ),
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

  InkWell contactButton({
    bool isWhatsApp = false,
    required BuildContext context,
    required String svgAsset,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: isWhatsApp == true
            ? const EdgeInsets.all(8)
            : const EdgeInsets.all(12),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.greyBorderDetails,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          svgAsset,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Padding customTextColumnInformation({
    required String text,
    required TextStyle textStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 2,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
