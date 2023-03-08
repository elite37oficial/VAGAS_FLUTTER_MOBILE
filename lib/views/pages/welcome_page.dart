import 'package:flutter/material.dart';
import '../../core/ui/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 124, 166, 1),
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
                      height: mediaQuery.size.height * .6,
                      width: mediaQuery.size.width * .9,
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
                        color: AppColors.neutral,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    child: SvgPicture.asset(
                      'assets/images/logo_elite_37.svg',
                      height: mediaQuery.size.height * 0.36,
                      width: mediaQuery.size.width * .4,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 35,
                      right: 35,
                      bottom: 10,
                      top: 20,
                    ),
                    child: Text(
                      'Encontre aqui as melhores vagas de Flutter!',
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.neutral,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40,
                      right: 40,
                      bottom: 40,
                    ),
                    child: Text(
                      "Aqui na EliteVagas você terá acesso\n"
                      "direto com os recrutadores",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQuery.size.height * .06,
                width: mediaQuery.size.width * .8,
                child: ElevatedButton(
                  onPressed: () {},
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
