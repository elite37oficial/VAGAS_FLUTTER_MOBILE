import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_dialog_buttom.dart';
import '../../../domain/entities/description_job_entity.dart';
import '../../core/model/report_options.dart';
import '../../core/styles/app_colors.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_check_box_button.dart';
import 'bloc/report_job_bloc.dart';

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
          SelectedReportJobEvent(
            false,
            false,
            false,
            false,
            false,
            false,
            false,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final List<ReportModel> reportsListText = [
      ReportModel(title: "A vaga não corresponde à descrição", isSelect: false),
      ReportModel(title: "A vaga é enganosa ou fraudulenta", isSelect: false),
      ReportModel(
          title: "A empresa tem práticas discriminatórias", isSelect: false),
      ReportModel(
          title: "O salário oferecido é muito baixo ou injusto",
          isSelect: false),
      ReportModel(
          title:
              "A vaga está sendo divulgada por uma empresa suspeita ou não confiável",
          isSelect: false),
      ReportModel(
          title: "A vaga contém erros ou informações confusas",
          isSelect: false),
      ReportModel(title: "Outro (por favor, especifique)", isSelect: false),
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
                        text: reportsListText[index].title,
                        isSelect: reportsListText[index].isSelect,
                        onTap: () {
                          reportsListText[index].isSelect =
                              !reportsListText[index].isSelect;
                          context.read<ReportJobBloc>().add(
                                SelectedReportJobEvent(
                                  reportsListText[0].isSelect,
                                  reportsListText[1].isSelect,
                                  reportsListText[2].isSelect,
                                  reportsListText[3].isSelect,
                                  reportsListText[4].isSelect,
                                  reportsListText[5].isSelect,
                                  reportsListText[6].isSelect,
                                ),
                              );
                        },
                        wrapText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    onChanged: (_) {
                      context.read<ReportJobBloc>().add(
                            SelectedReportJobEvent(),
                          );
                    },
                    enabled: reportsListText[6].isSelect ? true : false,
                    controller: textController,
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
                    validator: (_text) {
                      final text = _text ?? "";
                      if (text.trim().isEmpty) {
                        return "Preencher o campo de report";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => ReportJobBloc().submit(
                        textController: textController.value.text,
                        reportsListText: reportsListText,
                        jobId: widget.descriptionJob.id,
                        context: context,
                      ),
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
                        style: context.textStyles.textInterRegular
                            .copyWith(fontSize: 18, color: AppColors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 31)
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          );
        },
      ),
    );
  }
}
