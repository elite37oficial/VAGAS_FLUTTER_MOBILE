import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_provider.dart';
import 'src/features/core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Elite-37',
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
