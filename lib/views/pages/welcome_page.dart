import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/helpers/size_extensions.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: context.percentHeight(.01),
            ),
            Text(
              "Vagas de Flutter de forma\n"
              "simplificada!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Color(0XFF387CA6)),
            ),
            Image.asset(
              'assets/images/logo_small.png',
              height: context.percentHeight(.3),
              width: context.percentWith(1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Elite ',
                  style: TextStyle(fontSize: 45, color: Color(0XFF387CA6)),
                ),
                Text(
                  'Vagas',
                  style: TextStyle(
                      fontSize: 45,
                      color: Color(0XFF387CA6),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: context.percentHeight(.01),
            ),
            SizedBox(
              width: context.percentWith(.8),
              height: context.percentHeight(.06),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF387CA6),
                  fixedSize: const Size(300, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Encontrar sua vaga'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
