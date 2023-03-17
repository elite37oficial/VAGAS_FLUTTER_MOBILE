import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_jobs_repository.dart';
import 'package:vagas_flutter_mobile/src/domain/usecase/get_jobs/get_jobs_usecase.dart';

class GetJobsUseCaseImp implements GetJobsUseCase {
  final GetJobsRepository _getJobsRepository;

  GetJobsUseCaseImp(this._getJobsRepository);
  @override
  Future<List<JobEntity>> call() async {
    return await _getJobsRepository();
  }
}
