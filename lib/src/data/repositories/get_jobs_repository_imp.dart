import 'package:vagas_flutter_mobile/src/data/datasource/get_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';
import '../../domain/repositories/get_jobs_repository.dart';

class GetJobsRepositoryImp implements GetJobsRepository {
  final GetJobsDataSource _getJobsDataSource;

  GetJobsRepositoryImp(this._getJobsDataSource);
  @override
  Future<List<JobEntity>> call() async {
    return await _getJobsDataSource();
  }
}
