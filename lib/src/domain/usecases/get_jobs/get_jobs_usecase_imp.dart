import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_jobs_repository.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_jobs/get_jobs_usecase.dart';

class GetJobUseCaseImp implements GetJobsUseCase {
  final GetJobsRepository _getJobsRepository;
  GetJobUseCaseImp(
    this._getJobsRepository,
  );
  @override
  Future<List<JobEntity>> call() async {
    return _getJobsRepository();
  }
}
