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
          child: Padding(
            padding: const EdgeInsets.only(
              top: 25,
              right: 8.0,
              left: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextColumnInformation(
                  text: listJobs.jobOportunity,
                  fontSize: 28,
                  color: AppColors.greyBlue,
                ),
                customTextColumnInformation(
                  text: listJobs.company,
                  color: AppColors.black,
                  fontSize: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 8.0,
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
                            text: listJobs.city,
                            fontSize: 18,
                            color: AppColors.greyBlue,
                          ),
                          customTextColumnInformation(
                            //text: listJobs.modality,
                            text: 'Remoto',
                            fontSize: 18,
                            color: AppColors.greyBlue,
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
                            text: 'Tempo Integral',
                            fontSize: 18,
                            color: AppColors.greyBlue,
                          ),
                          customTextColumnInformation(
                            text: 'Jr',
                            fontSize: 18,
                            color: AppColors.greyBlue,
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
                        left: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        'Meios de contato:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyBlue,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.grey,
                              width: 1,
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greyLight,
                            ),
                            onPressed: () {},
                            child: SvgPicture.asset(
                              'assets/images/icon_vacant_link.svg',
                              width: context.percentWidth(.06),
                              height: context.percentHeight(.06),
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.grey,
                              width: 1,
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greyLight,
                            ),
                            onPressed: () {},
                            child: SvgPicture.asset(
                              'assets/images/icons8-whatsapp-48.svg',
                              width: context.percentWidth(.04),
                              height: context.percentHeight(.04),
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.grey,
                              width: 1,
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greyLight,
                            ),
                            onPressed: () {},
                            child: Image.asset(
                              'assets/images/icons8-gmail.svg',
                              width: context.percentWidth(.08),
                              height: context.percentHeight(.08),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20),
                  child: Text(
                    'Sobre a vaga',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 20,
                    right: 25,
                    bottom: 25,
                    //bottom: 50,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Estamos contratando Desenvolvedor Front-end Flutter para a execução de projetos de transformação digital, desenvolvendo ferramentas inovadoras para entregar a melhor experiência para os usuários da plataforma de uma grande empresa. Se você conhece ou deseja aprendizado em Redux, Kotlin, React Native, Swift; desenvolveu e implantou aplicativos na App Store ou Google Play; AWS; Javascript ES6+, Node Js; desenvolvimento de aplicações web responsivas; design patterns; pencil, balsamiq; Metodologias Ágeis; GraphQL; será um grande diferencial para oportunidade. Atuação 100% remota. \n\nBeneficios \n\nVale Transporte; \n\nVale Refeição; \n\nAssistência Médica; \n\nAssistência Odontológica; \n\nFormação Acadêmica \n\nEnsino Superior Completo \n\nExperiência \n\nEntendemos que para essa evolução, é necessário o conhecimento nas tecnologias: Flutter; Google Firebase; React.Js; CI/CD; Android Crashlytics; Jest. \n\nSalário \n\nAcima de R\$ 10.000,00 \n\nCargo \n\nAnalista Desenvolvedor Front End \n\nEmpresa \n\nInnolevels \n\nAtua como reparação e manutenção de computadores e de equipamentos periféricos. \n\nRamo \n\nInformática/ Tecnologia",
                      //style: DefaultTextStyle.of(context).style,
                      style: TextStyle(
                        //fontFamily: 'textLatoThin',
                        color: AppColors.black,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'contratando',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.cardDetail,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                  // child: Text(
                  //   "Estamos contratando Desenvolvedor Front-end Flutter para a execução de projetos de transformação digital, desenvolvendo ferramentas inovadoras para entregar a melhor experiência para os usuários da plataforma de uma grande empresa. Se você conhece ou deseja aprendizado em Redux, Kotlin, React Native, Swift; desenvolveu e implantou aplicativos na App Store ou Google Play; AWS; Javascript ES6+, Node Js; desenvolvimento de aplicações web responsivas; design patterns; pencil, balsamiq; Metodologias Ágeis; GraphQL; será um grande diferencial para oportunidade. Atuação 100% remota. \n\nBeneficios \n\nVale Transporte; \n\nVale Refeição; \n\nAssistência Médica; \n\nAssistência Odontológica; \n\nFormação Acadêmica \n\nEnsino Superior Completo \n\nExperiência \n\nEntendemos que para essa evolução, é necessário o conhecimento nas tecnologias: Flutter; Google Firebase; React.Js; CI/CD; Android Crashlytics; Jest. \n\nSalário \n\nAcima de R\$ 10.000,00 \n\nCargo \n\nAnalista Desenvolvedor Front End \n\nEmpresa \n\nInnolevels \n\nAtua como reparação e manutenção de computadores e de equipamentos periféricos. \n\nRamo \n\nInformática/ Tecnologia",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //   ),
                  //   textAlign: TextAlign.justify,
                  //   softWrap: true,
                  // ),
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greyBlue,
                          ),
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
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              "Tecnologia da informação e serviços. Compartilhando ideias. Transformando pessoas. Desenvolvendo negócios.",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.justify,
                              softWrap: true, // Quebra de linha automatica
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
                      //highlightColor: Colors.green,
                      splashColor: AppColors.white,
                      onTap: () {},
                      child: Text(
                        'Denunciar essa vaga',
                        style: TextStyle(
                          color: AppColors.greyBlue,
                          fontSize: 16,
                        ),
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

  Padding customTextColumnInformation({
    required String text,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 2,
        left: 10,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
