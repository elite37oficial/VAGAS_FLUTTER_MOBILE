import 'package:flutter/material.dart';

import 'package:vagas_flutter_mobile/src/components/card_widget.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/text_styles.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          VagasCard(
            jobOportunity: "Desenvolvedor Flutter Jr.",
            company: "Elite 37",
            city: "São Paulo",
            jobType: "Full Time",
            value: "15.000,00",
            path: 'assets/images/linkedin.png',
          )
        ]),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
