// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/core/ui/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/data/mock_job.dart';
import 'package:vagas_flutter_mobile/models/job_model.dart';
import '../../core/ui/styles/app_colors.dart';
import 'vacancy_detail_text.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 20),
                child: Text(
                  listJobs.jobOportunity,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      left: 10,
                      right: 10,
                    ),
                    // child: SizedBox(
                    //   child: ClipRRect(
                    //     borderRadius: const BorderRadius.only(
                    //       topLeft: Radius.circular(15.0),
                    //       topRight: Radius.circular(15.0),
                    //       bottomLeft: Radius.circular(15.0),
                    //       bottomRight: Radius.circular(15.0),
                    //     ),
                    //     child: Image.network(
                    //       listJobs.imageUrl,
                    //       width: context.percentHeight(.06),
                    //       height: context.percentHeight(.06),
                    //     ),
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 10,
                    ),
                    child: Text(
                      listJobs.company,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 10,
                    ),
                    child: Text(
                      listJobs.city,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      '(Remoto)',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              customTextColumn(
                text: 'Faixa Salarial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              customTextColumn(
                text: listJobs.value.toString(),
              ),
              
              customTextColumn(
                text: 'Tipo',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              
              customTextColumn(text: listJobs.jobType),
              
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
                  'CLT',
                  style: TextStyle(
                    fontSize: 18,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 35, left: 20),
                child: Text(
                  'Sobre a vaga',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 25,
                  //bottom: 50,
                ),
                child: Text(
                  "Vaga para Desenvolvedor Pleno: \nO candidato deve ter experiência sólida em desenvolvimento de software e ser capaz de trabalhar de forma independente para projetar, implementar e testar novas funcionalidades. Deve ter conhecimento avançado em pelo menos uma linguagem de programação, habilidades de resolução de problemas e capacidade de trabalhar em equipe.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 35,
                    ),
                    child: Text(
                      'Sobre a empresa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              left: 20,
                              right: 10,
                            ),
                            child: SizedBox(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                child: Image.network(
                                  listJobs.imageUrl,
                                  width: context.percentHeight(.06),
                                  height: context.percentHeight(.06),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 15.0,
                              right: 10,
                            ),
                            child: Text(
                              listJobs.company,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          // SvgPicture.asset(
                          //   'assets/images/logo_ifood.svg',
                          //   width: context.percentHeight(.06),
                          //   height: context.percentHeight(.06),
                          // ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                          left: 20,
                          right: 25,
                          bottom: 30,
                        ),
                        child: Text(
                          "Vaga para Desenvolvedor Pleno: \nO candidato deve ter experiência sólida em desenvolvimento de software e ser capaz de trabalhar de forma independente para projetar, implementar e testar novas funcionalidades. Deve ter conhecimento avançado em pelo menos uma linguagem de programação, habilidades de resolução de problemas e capacidade de trabalhar em equipe.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify,
                          softWrap: true,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(''),
                      ),
                      //Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(''),
                      ),
                      //Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Jabulane'),
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Denunciar essa vaga',
                        style: TextStyle(
                          color: AppColors.greyBlue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding customTextColumn({
    required String text,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
