import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/bloc/custom_drawer_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/bloc/list_jobs_home_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/views/report_job/bloc/report_job_bloc.dart';
import 'src/features/core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListJobsHomeBloc()),
        BlocProvider(create: (context) => CustomDrawerBloc()),
        BlocProvider(create: (context) => ReportJobBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elite-37',
        onGenerateRoute: generateRoute,
        navigatorObservers: <NavigatorObserver>[observer],
      ),
    );
  }
}
