import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_description_jobs/mock/get_description_jobs_datasource_mock_imp.dart';
import 'package:vagas_flutter_mobile/src/data/repositories/get_description_jobs/get_description_jobs_repository_imp.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/image_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_app_bar.dart';
import 'package:vagas_flutter_mobile/src/features/views/job_details/job_details_controller.dart';
import 'package:vagas_flutter_mobile/src/features/views/job_details/job_details_state.dart';
import '../../../domain/usecases/get_description_jobs/get_description_jobs_usecase_imp.dart';
import '../../core/ui/styles/app_colors.dart';

class JobDetailsView extends StatefulWidget {
  final String id;
  const JobDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<JobDetailsView> createState() => _JobDetailsViewState();
}

class _JobDetailsViewState extends State<JobDetailsView> {
  final JobDetailController _jobDetailController = JobDetailController(
    GetDescriptionJobsUseCaseImp(
      GetDescriptionJobsRepositoryImp(
        GetDescriptionJobsDataSourceMockImp(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => _jobDetailController.getDetails(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Detalhes da vaga"),
      body: ValueListenableBuilder(
        valueListenable: _jobDetailController,
        builder: (context, state, child) {
          if (state is EmptyJobDetailsState) {
            return Center(
              child: Text("Está vaga ainda não tem detalhes disponiveis..."),
            );
          }
          if (state is DescriptionjobDetailsState) {
            final descriptionJob = state.descriptionJob;
            return SafeArea(
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
                        descriptionJob.oportunity,
                        style: context.textStyles.textTitleDetails,
                      ),
                      customTextColumnInformation(
                        text: descriptionJob.company,
                        textStyle:
                            context.textStyles.textEmphasisDetails.copyWith(
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
                                  text: " ${descriptionJob.city} - ",
                                  textStyle:
                                      context.textStyles.textEmphasisDetails,
                                ),
                                customTextColumnInformation(
                                  text: descriptionJob.modality,
                                  textStyle:
                                      context.textStyles.textEmphasisDetails,
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
                                  text: ' ${descriptionJob.type} - ',
                                  textStyle:
                                      context.textStyles.textEmphasisDetails,
                                ),
                                customTextColumnInformation(
                                  text: descriptionJob.seniority,
                                  textStyle:
                                      context.textStyles.textEmphasisDetails,
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
                          descriptionJob.description,
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: Image.network(
                                              descriptionJob.imageUrl,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          descriptionJob.company,
                                          style: context
                                              .textStyles.textCompanyDetails,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    descriptionJob.aboutCompany,
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
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
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
