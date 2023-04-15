import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/bloc/custom_drawer_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/bloc/list_jobs_home_bloc.dart';
import 'src/features/core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ListJobsHomeBloc()),
        BlocProvider(create: (context) => CustomDrawerBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elite-37',
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
