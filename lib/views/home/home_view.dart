import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/core/ui/styles/app_colors.dart';
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
          title: const Text(
            "Elite Vagas",
            style: TextStyle(fontSize: 32),
          ),
          backgroundColor: AppColors.appBar,
          elevation: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.appBar,
              title: const Text(
                "Busque pela vaga ideal...",
                style: TextStyle(color: Colors.black),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 22, right: 22, top: 38, bottom: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vagas",
                              style: context.textStyles.textTitleCards,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Filtros",
                                  style: context.textStyles.textFilterCards,
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.tune_rounded,
                                  color: AppColors.cardFilter,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              expandedHeight: 150,
              floating: true,
              pinned: false,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: jobsList.length,
                  (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: CardWidget(job: jobsList[index]),
                      )),
            ),
          ],
        )

        // Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             "Vagas",
        //             style: context.textStyles.textTitleCards,
        //           ),
        //           const SizedBox(
        //             width: 25.28,
        //             height: 20,
        //             child: Icon(
        //               Icons.tune,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 32),
        //         child: CustomListViewBuilder(
        //             customSliverAppBar: Text("data"), itemCount: jobsList.length),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
