import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elite-37',
      onGenerateRoute: generateRoute,
    );
  }
}
