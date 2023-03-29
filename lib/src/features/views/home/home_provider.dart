import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_jobs/get_jobs_usecase_imp.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_controller.dart';
import '../../../data/datasource/mock/get_jobs/get_jobs_datasource_mock_imp.dart';
import '../../../data/repositories/get_jobs_repository_imp.dart';

class HomeProvider with ChangeNotifier {
  final HomeController homeController = HomeController(
    GetJobUseCaseImp(
      GetJobsRepositoryImp(
        GetJobsDataSourceMockImp(),
      ),
    ),
  );
}
