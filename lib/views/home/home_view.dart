import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/models/job_model.dart';
import '../../core/ui/widgets/card/card_widget.dart';
import '../../data/mock_job.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobsList = mockJob;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Elite Vagas"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vagas",
                  style: context.textStyles.textTitle,
                ),
                Icon(Icons.tune),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ListView.builder(
                itemCount: jobsList.length,
                itemBuilder: (context, index) =>
                    CardWidget(job: jobsList[index]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
