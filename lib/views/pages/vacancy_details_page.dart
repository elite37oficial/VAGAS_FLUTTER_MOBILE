import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/core/ui/helpers/size_extensions.dart';

import '../../core/ui/styles/app_colors.dart';

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
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/logo_ifood.svg',
                  width: context.percentHeight(.1),
                  height: context.percentHeight(.1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
