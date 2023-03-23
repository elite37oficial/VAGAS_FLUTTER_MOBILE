import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_home_jobs/get_home_jobs_usecase.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_state.dart';

class HomeController extends ValueNotifier<HomeState> {
  final GetHomeJobsUseCase _getJobsUseCase;
  HomeController(this._getJobsUseCase) : super(LoadingHomeState());

  Future<void> getJobs() async {
    try {
      List<HomeJobEntity> listJobs = await _getJobsUseCase();
      if (listJobs.isEmpty) {
        value = EmptyHomeState();
      } else {
        value = ListJobsHomeState(listJobs: listJobs);
      }
    } catch (e) {
      value = ErroHomeState(e.toString());
    }
  }
}
