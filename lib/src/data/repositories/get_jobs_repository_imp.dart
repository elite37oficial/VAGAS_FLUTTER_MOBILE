import 'package:vagas_flutter_mobile/src/data/datasource/get_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/mock/get_jobs/mock_job.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_jobs_repository.dart';

class GetJobsRepositoryImp implements GetJobsRepository {
  final GetJobsDataSource _getJobsDataSource;

  GetJobsRepositoryImp(this._getJobsDataSource);
  @override
  Future<List<JobEntity>> call() async {
    return _getJobsDataSource();
  }
}
