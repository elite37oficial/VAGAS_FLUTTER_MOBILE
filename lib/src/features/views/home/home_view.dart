import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_app_bar.dart';
import 'package:vagas_flutter_mobile/src/features/core/models/job_model.dart';
import '../../core/ui/widgets/card_widget.dart';
import '../../core/ui/widgets/custom_sliver_app_bar.dart';
import '../../../data/datasource/mock/mock_job.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobModel> jobsList = mockJob;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: !Navigator.canPop(context),
            backgroundColor: AppColors.appBar,
            title: CustomSliverAppBar(),
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
                          left: 22, right: 22, top: 24, bottom: 24),
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
            expandedHeight: 140,
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
      ),
    );
  }
}
