import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF387CA6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: mediaQuery.size.height * .1),
            Image.asset(
              'assets/images/logo_elite_37.png',
              height: mediaQuery.size.height * .5,
              width: mediaQuery.size.width * .7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 20),
                  child: Text(
                    'EliteVagas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 20),
                  child: Text(
                    'Encontre aqui as melhores vagas de Flutter!',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey[100],
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: Text(
                    'Aqui na EliteVagas você terá acesso direto com os recrutadores',
                    style: TextStyle(
                      color: Colors.grey[100],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: mediaQuery.size.height * .06,
              width: mediaQuery.size.width * .8,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                ),
                child: const Text(
                  'Ver vagas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
