import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/core/ui/widgets/custom_list_view_builder.dart';
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
        body: CustomListViewBuilder(
          customSliverAppBar: Text("data"),
          itemCount: 1000,
        ));
  }
}
