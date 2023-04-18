import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/views/report_job/bloc/report_job_bloc.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_check_box_button.dart';

class ReportJobView extends StatefulWidget {
  final DescriptionJobEntity descriptionJob;

  const ReportJobView({
    Key? key,
    required this.descriptionJob,
  }) : super(key: key);

  @override
  State<ReportJobView> createState() => _ReportJobViewState();
}

class _ReportJobViewState extends State<ReportJobView> {
  @override
  void initState() {
    super.initState();
    context.read<ReportJobBloc>().add(
          SelectedReportJobEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> reportsListText = [
      "A vaga não corresponde à descrição",
      "A vaga é enganosa ou fraudulenta",
      "A empresa tem práticas discriminatórias",
      "O salário oferecido é muito baixo ou injusto",
      "A vaga está sendo divulgada por uma empresa suspeita ou não confiável",
      "A vaga contém erros ou informações confusas",
      "Outro (por favor, especifique)",
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: "Central de Ajuda",
      ),
      body: BlocBuilder<ReportJobBloc, ReportJobState>(
        builder: (context, state) {
          if (state is IsEmptyReportJobState) {
            return Center(
              child: Text("Sem opções de report no momento"),
            );
          }
          if (state is SelectedReportJobState) {
            List<bool> reportsListSelect = [
              state.isReportDescription,
              state.isReportFraud,
              state.isReportDescrimination,
              state.isReportUnfairSalary,
              state.isReportUnrealiableCompany,
              state.isReportError,
              state.isReportOther
            ];
            return Padding(
              padding: const EdgeInsets.only(
                right: 23,
                left: 23,
              ),
              child: ListView(
                children: [
                  SizedBox(height: 24),
                  Text(
                    'Denunciar violações das diretrizes da nossa comunidade',
                    style: context.textStyles.textInterBold.copyWith(
                      fontSize: 18,
                      color: AppColors.darker,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Use esse formulário para denunciar vagas que violem nossas Diretrizes do Elite Vagas. Ao dencuniar uma vaga, suas informações NÃO serão compartilhadas com a pessoa cuja a vaga está sendo denunciado.',
                    style: context.textStyles.textLatoRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    'Vaga',
                    style: context.textStyles.textInterRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.darker,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.descriptionJob.title,
                    style: context.textStyles.textInterRegular.copyWith(
                      fontSize: 16,
                      color: AppColors.greyLight,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Seu endereço de e-mail (opcional)',
                    style: context.textStyles.textInterRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.darker,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    cursorColor: AppColors.darker,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: context.textStyles.textInterRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.greyLight,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Motivo(s) da denúncia',
                    style: context.textStyles.textInterRegular.copyWith(
                      fontSize: 14,
                      color: AppColors.darker,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reportsListText.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CustomCheckBoxButton(
                        text: reportsListText[index],
                        isSelect: reportsListSelect[index],
                        onTap: () {
                          reportsListSelect[index] = !reportsListSelect[index];
                          context.read<ReportJobBloc>().add(
                                SelectedReportJobEvent(
                                  reportsListSelect[0],
                                  reportsListSelect[1],
                                  reportsListSelect[2],
                                  reportsListSelect[3],
                                  reportsListSelect[4],
                                  reportsListSelect[5],
                                  reportsListSelect[6],
                                ),
                              );
                        },
                        wrapText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    cursorColor: AppColors.darker,
                    decoration: InputDecoration(
                      hintText: 'Especifique aqui',
                      hintStyle: context.textStyles.textInterRegular.copyWith(
                        fontSize: 16,
                        color: AppColors.greyLight,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.primary,
                        fixedSize: Size(300, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Enviar Denúncia',
                        style: context.textStyles.textInterRegular.copyWith(
                          fontSize: 18,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 31)
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
