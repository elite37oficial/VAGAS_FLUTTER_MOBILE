// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/core/ui/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/data/mock_job.dart';
import 'package:vagas_flutter_mobile/models/job_model.dart';
import '../../core/ui/styles/app_colors.dart';

class VacancyDetailsPage extends StatelessWidget {
  const VacancyDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobModel listJobs = mockJob[0];
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35, left: 20),
                child: Text(
                  'Desenvolvedor Jr/Pleno',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 20, right: 10),
                    child: SizedBox(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/logo_ifood.svg',
                          width: context.percentHeight(.06),
                          height: context.percentHeight(.06),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Ifood',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 20),
                child: Text(
                  'Faixa Salarial',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "R\$ 6.500,00",
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Local',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Remoto',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Regime',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  'CLT/PJ',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 35, left: 20),
                child: Text(
                  'Descrição da vaga',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 25,
                  bottom: 50,
                ),
                child: Text(
                  "Vaga para Desenvolvedor Pleno:\nO candidato deve ter experiência"
                  " sólida em desenvolvimento de software e ser capaz de trabalhar"
                  " de forma independente para projetar, implementar e testar novas"
                  " funcionalidades. Deve ter conhecimento avançado em pelo menos"
                  " uma linguagem de programação, habilidades de resolução de"
                  " problemas e capacidade de trabalhar em equipe.",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Denunciar essa vaga',
                    style: TextStyle(color: AppColors.greyBlue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
