import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/models/job_model.dart';
import "../card/card_widget.dart";
import '../../data/mock_job.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobsList = MockJob;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Elite Vagas"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Vagas"),
                  Icon(Icons.tune),
                ],
              ),
            ),
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => CardWidget(job: jobsList[0]),
            )
          ],
        ),
      ),
    );
  }
}
