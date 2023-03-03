import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Elite Vagas"),
          ),
          body: Column(
            children: [
              Row(
                children: [
                  Text("Vagas"),
                  Icon(Icons.filter),
                ],
              ),
            ],
          )),
    );
  }
}
