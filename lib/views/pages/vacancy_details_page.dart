import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/core/ui/helpers/size_extensions.dart';

import '../../core/ui/styles/app_colors.dart';

import 'vacancy_detail_text.dart';

class VacancyDetailsPage extends StatelessWidget {
  const VacancyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da vaga'),
        backgroundColor: AppColors.greyBlue,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/logo_ifood.svg',
                      width: context.percentHeight(.05),
                      height: context.percentHeight(.05),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Ifood'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Desenvolvedor Jr./Pleno',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VacancyDetailText(
                    option_text: 'Faixa Salarial',
                    description_text: r'R$ 6.500,00',
                  ),
                  VacancyDetailText(
                    option_text: 'Local',
                    description_text: 'Remoto',
                  ),
                  VacancyDetailText(
                    option_text: 'Regime',
                    description_text: 'CLT/PJ',
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    endIndent: 1,
                    indent: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
