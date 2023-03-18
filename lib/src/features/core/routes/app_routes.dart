import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_view.dart';
import 'package:vagas_flutter_mobile/src/features/views/splash/splash_screen_view.dart';
import 'package:vagas_flutter_mobile/src/features/views/job_details/job_details_view.dart';
import 'package:vagas_flutter_mobile/src/features/views/welcome/welcome_view.dart';

class AppRoutes {
  static const splash = "/";
  static const welcome = "welcome";
  static const home = "/home";
  static const jobDetail = "/jobDetail";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (context) => SplashScreenView());
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: (context) => WelcomeView());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case AppRoutes.jobDetail:
      return MaterialPageRoute(
        builder: (context) {
          var listjobs = settings.arguments as JobEntity;
          return JobDetailsView(listJobs: listjobs);
        },
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(body: Text("Página não encontrada")),
      );
  }
}
