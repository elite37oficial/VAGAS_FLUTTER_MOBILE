import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/mock/get_jobs/get_jobs_datasource_mock_imp.dart';
import 'package:vagas_flutter_mobile/src/data/repositories/get_jobs_repository_imp.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_jobs/get_jobs_usecase_imp.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_app_bar.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_controller.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_state.dart';

import '../../core/ui/widgets/card_widget.dart';
import '../../core/ui/widgets/custom_sliver_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = HomeController(
    GetJobUseCaseImp(
      GetJobsRepositoryImp(
        GetJobsDataSourceMockImp(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => _homeController.getJobs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(),
        body: ValueListenableBuilder(
          valueListenable: _homeController,
          builder: (context, state, child) {
            if (state is EmptyHomeState) {
              return Center(
                child: Text("Você não tem vagas disponíveis..."),
              );
            }
            if (state is ListJobsHomeState) {
              final jobList = state.listJobs;
              return CustomScrollView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Vagas",
                                    style: context.textStyles.textTitleCards,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Filtros",
                                        style:
                                            context.textStyles.textFilterCards,
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
                        childCount: jobList.length,
                        (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: CardWidget(job: jobList[index]),
                            )),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
