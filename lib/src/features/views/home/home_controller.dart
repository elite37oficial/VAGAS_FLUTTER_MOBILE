import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_home_jobs/get_home_jobs_usecase.dart';

class HomeController {
  final GetHomeJobsUseCase _getJobsUseCase;
  HomeController(this._getJobsUseCase);

  Future<List<HomeJobEntity>> getJobs() async {
    final List<HomeJobEntity> listJobs = await _getJobsUseCase();
    return listJobs;
  }

  // Future<void> getJobs() async {
  //   try {
  //     List<HomeJobEntity> listJobs = await _getJobsUseCase();
  //     if (listJobs.isEmpty) {
  //       value = EmptyHomeState();
  //     } else {
  //       value = ListJobsHomeState(listJobs: listJobs);
  //     }
  //   } catch (e) {
  //     value = ErroHomeState(e.toString());
  //   }
  // }
}
