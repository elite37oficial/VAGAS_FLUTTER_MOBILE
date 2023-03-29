import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_jobs/get_jobs_usecase.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_state.dart';

class HomeController extends ValueNotifier<HomeState>{
  final GetJobsUseCase _getJobsUseCase;
  HomeController(this._getJobsUseCase) : super(LoadingHomeState());

  Future<void> getJobs() async {
    try {
      List<JobEntity> listJobs = await _getJobsUseCase();
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
