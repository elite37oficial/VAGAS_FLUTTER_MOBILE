import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_app_bar.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/widgets/custom_drawer.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/bloc/list_jobs_home_bloc.dart';
import '../../core/ui/widgets/card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final endDrawerIsOpen = false;

  @override
  void initState() {
    super.initState();
    context.read<ListJobsHomeBloc>().add(GetListJobsHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(),
      appBar: CustomAppBar(
        actions: [
          IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/search.svg"),
          ),
          IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/about.svg"),
          )
        ],
      ),
      body: BlocBuilder<ListJobsHomeBloc, ListJobsHomeState>(
        builder: (context, state) {
          if (state is ListJobsHomeEmptyState) {
            return Center(
              child: Text("Você não tem vagas disponíveis..."),
            );
          }
          if (state is ListJobsHomeInitialState) {
            return Center(
              child: Text("Nenhuma vaga pesquisada"),
            );
          }
          if (state is ListJobsHomeCompletedState) {
            final jobList = state.listJobs;
            return ListView(
              children: [
                const SizedBox(),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Vagas",
                        style: context.textStyles.textInterRegular.copyWith(
                          color: AppColors.darker,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Filtros",
                            style: context.textStyles.textInterRegular.copyWith(
                              color: AppColors.grey500,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: Icon(Icons.tune_rounded),
                              color: AppColors.grey500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: jobList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: CardWidget(
                      homeJob: jobList[index],
                      id: jobList[index].id,
                    ),
                  ),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
