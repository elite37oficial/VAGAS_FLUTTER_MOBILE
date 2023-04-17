import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/routes/app_routes.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/bloc/list_jobs_home_bloc.dart';
import '../../core/widgets/card_widget.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final endDrawerIsOpen = false;
  bool filterAppBar = false;

  @override
  void initState() {
    super.initState();
    context.read<ListJobsHomeBloc>().add(GetListJobsHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: AppColors.white,
      endDrawer: CustomDrawer(),
      appBar: CustomAppBar(
        filterAppBar: filterAppBar,
        leading: IconButton(
          splashRadius: 20,
          padding: EdgeInsets.zero,
          icon: Icon(
            Platform.isAndroid
                ? Icons.arrow_back
                : Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {
            setState(() {
              filterAppBar = false;
            });
          },
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            onPressed: () {
              setState(() {
                filterAppBar = true;
              });
            },
            icon: SvgPicture.asset("assets/images/search.svg"),
          ),
          PopupMenuButton(
            onSelected: (_) {
              Navigator.of(context).pushNamed(AppRoutes.about);
            },
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset("assets/images/about.svg"),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 0,
                child: Center(
                  child: Text(
                    "Sobre o App",
                    style: context.textStyles.textLatoBold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: BlocBuilder<ListJobsHomeBloc, ListJobsHomeState>(
        builder: (context, state) {
          if (state is ListJobsHomeIsEmptyState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: SvgPicture.asset(
                                  "assets/images/IconFilter.svg"),
                              color: AppColors.grey500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text("Sem vagas disponíveis..."),
                SizedBox.shrink(),
              ],
            );
          }
          if (state is ListJobsHomeInitialState) {
            return const Center(
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              icon: SvgPicture.asset(
                                  "assets/images/IconFilter.svg"),
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
