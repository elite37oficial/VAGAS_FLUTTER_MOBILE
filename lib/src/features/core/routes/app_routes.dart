import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_view.dart';
import 'package:vagas_flutter_mobile/src/features/views/report_job/report_job_view.dart';
import 'package:vagas_flutter_mobile/src/features/views/splash/splash_screen_view.dart';
import 'package:vagas_flutter_mobile/src/features/views/welcome/welcome_view.dart';
import '../../views/about/about_view.dart';
import '../../views/job_details/job_details_view.dart';

class AppRoutes {
  static const splash = "/";
  static const welcome = "welcome";
  static const home = "/home";
  static const jobDetail = "/jobDetail";
  static const filter = "/filter";
  static const reportJob = "/reportJob";
  static const about = "/about";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (context) => SplashScreenView());
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: (context) => WelcomeView());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => HomeView());
    case AppRoutes.about:
      return MaterialPageRoute(builder: (context) => AboutView());
    case AppRoutes.reportJob:
      return MaterialPageRoute(builder: (context) {
        var descriptionJob = settings.arguments as DescriptionJobEntity;
        return ReportJobView(descriptionJob: descriptionJob);
      });
    case AppRoutes.jobDetail:
      return MaterialPageRoute(
        builder: (context) {
          var id = settings.arguments as String;
          return JobDetailsView(
            id: id,
          );
        },
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(body: Text("Página não encontrada")),
      );
  }
}
