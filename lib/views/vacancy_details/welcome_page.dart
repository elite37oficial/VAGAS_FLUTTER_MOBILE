import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/routes/app_routes.dart';
import 'package:vagas_flutter_mobile/core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBlue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Positioned(
                    child: SvgPicture.asset(
                      'assets/images/background_icons.svg',
                      height: context.percentHeight(.6),
                      width: context.percentWidth(.9),
                    ),
                  ),
                  Positioned(
                    bottom: 3,
                    left: 0,
                    child: Text(
                      'EliteVagas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    child: SvgPicture.asset(
                      'assets/images/logo_elite_37.svg',
                      height: context.percentHeight(0.36),
                      width: context.percentWidth(.4),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 10,
                      top: 20,
                    ),
                    child: Text(
                      'Encontre aqui as melhores vagas de Flutter!',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      bottom: 40,
                    ),
                    child: Text(
                      "Aqui na EliteVagas você terá acesso\n"
                      "direto com os recrutadores",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.percentHeight(.06),
                width: context.percentWidth(.8),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.grey,
                  ),
                  child: Text(
                    'Ver vagas',
                    style: TextStyle(
                      color: AppColors.greyBlue,
                      fontSize: 17,
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
}
