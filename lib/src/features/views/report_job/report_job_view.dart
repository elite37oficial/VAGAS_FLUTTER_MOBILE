import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';

import '../../core/ui/widgets/custom_check_box_button.dart';

class ReportJobView extends StatefulWidget {
  const ReportJobView({super.key});

  @override
  State<ReportJobView> createState() => _ReportJobViewState();
}

class _ReportJobViewState extends State<ReportJobView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Central de Ajuda',
          style: context.textStyles.textInterRegular.copyWith(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              right: 23,
              left: 23,
              bottom: 31,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Denunciar violações das diretrizes da\nnossa comunidade',
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
                  'Desenvolvedor Jr./Pleno',
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
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 0,
                  text: 'A vaga não corresponde à descrição',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 1,
                  text: 'A vaga é enganosa ou fraudulenta',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 2,
                  text: 'A empresa tem práticas discriminatórias',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 3,
                  text: 'O salário oferecido é muito baixo ou injusto',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 4,
                  text:
                      'A vaga está sendo divulgada por uma empresa\nsuspeita ou não confiável',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 5,
                  text: 'A vaga contém erros ou informações confusas',
                ),
                SizedBox(
                  height: 16,
                ),
                CustomCheckBoxButton(
                  index: 6,
                  text: 'Outro (por favor, especifique)',
                ),
                SizedBox(
                  height: 16,
                ),
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
                  width: context.percentHeight(.8),
                  height: context.percentHeight(.06),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
