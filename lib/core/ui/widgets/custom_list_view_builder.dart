import 'package:flutter/material.dart';

import '../../../data/mock_job.dart';
import '../../../models/job_model.dart';
import 'card/card_widget.dart';

class CustomListViewBuilder extends StatelessWidget {
  final Widget customSliverAppBar;
  final int itemCount;
  const CustomListViewBuilder({
    Key? key,
    required this.customSliverAppBar,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobsList = mockJob;
    // return NestedScrollView(
    //   headerSliverBuilder: (BuildContext context, innerBoxIsScrolled) {
    //     return [
    //       SliverAppBar(
    //         title: customSliverAppBar,
    //         floating: true,
    //         pinned: false,
    //       ),
    //     ];
    //   },
    //   body: ListView.builder(
    //     itemBuilder: (context, i) => Text("data"),
    //   ),
    // );
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: customSliverAppBar,
          floating: true,
          pinned: false,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              childCount: jobsList.length,
              (context, index) => CardWidget(job: jobsList[index])),
        ),
      ],
    );
  }
}
