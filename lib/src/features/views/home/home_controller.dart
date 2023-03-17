import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecase/get_jobs/get_jobs_usecase.dart';

class HomeController {
  final GetJobsUseCase _getJobsUseCase;

  HomeController(this._getJobsUseCase);

  Future<List<JobEntity>> getList() async {
    final responseHomeControler = await _getJobsUseCase;
    return responseHomeControler();
  }
}
