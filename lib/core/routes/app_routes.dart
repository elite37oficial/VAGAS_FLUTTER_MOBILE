import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/views/home/home_view.dart';
import 'package:vagas_flutter_mobile/views/vacancy_details/vacancy_details_page.dart';
import 'package:vagas_flutter_mobile/views/vacancy_details/welcome_page.dart';

class AppRoutes {
  static const welcome = "/";
  static const home = "/home";
  static const vacancy = "/vacancy";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case AppRoutes.vacancy:
      return MaterialPageRoute(builder: (context) => VacancyDetailsPage());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(body: Text("Página não encontrada")),
      );
  }
}
