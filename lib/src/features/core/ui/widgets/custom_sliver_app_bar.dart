import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';

import '../../../../data/datasource/get_home_jobs/dio/get_home_jobs_datasource_dio_imp.dart';
import '../../../../data/repositories/get_home_jobs/get_home_jobs_repository_imp.dart';
import '../../../../domain/usecases/get_home_jobs/get_home_jobs_usecase_imp.dart';
import '../../../views/home/bloc/list_jobs_home_bloc.dart';
import '../../../views/home/home_controller.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = HomeController(
      GetHomeJobUseCaseImp(
        GetHomeJobsRepositoryImp(
          GetHomeJobsDataSourceDioImp(),
        ),
      ),
    );
    return Container(
      height: 43,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightActive,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: context.textStyles.textFilter
                  .copyWith(color: AppColors.white),
              decoration: InputDecoration(
                hintText: "Busque pela vaga ideal...",
                contentPadding: EdgeInsets.all(12),
                hintStyle: context.textStyles.textFilter,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.lightActive,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.primary,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // _homeController.getJobs();
              context.read<ListJobsHomeBloc>().add(ListJobsHome());
            },
            child: Container(
              height: 43,
              width: 94,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.lightActive,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Pesquisar",
                  style: context.textStyles.textFilter
                      .copyWith(color: AppColors.darker),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
