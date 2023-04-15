import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_app_bar.dart';

import '../../core/ui/widgets/custom_check_box_button.dart';

class ReportJobView extends StatelessWidget {
  final DescriptionJobEntity descriptionJob;

  const ReportJobView({
    Key? key,
    required this.descriptionJob,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> reportsList = [
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
      body: Padding(
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
                color: AppColors.greyDark,
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
              descriptionJob.title,
              style: context.textStyles.textInterRegular.copyWith(
                fontSize: 16,
                color: AppColors.greyDark,
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
                  color: AppColors.greyDark,
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
              itemCount: reportsList.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 16),
                child: CustomCheckBoxButton(
                  text: reportsList[index],
                  // index: index,
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
                  color: AppColors.greyDark,
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
      ),
    );
  }
}
