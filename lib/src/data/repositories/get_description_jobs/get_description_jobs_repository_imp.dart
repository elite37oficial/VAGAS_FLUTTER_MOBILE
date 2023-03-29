import '../../../domain/entities/description_job_entity.dart';
import '../../../domain/repositories/get_description_jobs/get_description_jobs_repository.dart';
import '../../datasource/get_description_jobs/get_description_jobs_datasource.dart';

class GetDescriptionJobsRepositoryImp implements GetDescriptionJobsRepository {
  final GetDescriptionJobsDataSource _getDescriptionJobsDataSource;

  GetDescriptionJobsRepositoryImp(this._getDescriptionJobsDataSource);
  @override
  Future<DescriptionJobEntity> call(int id) async {
    return await _getDescriptionJobsDataSource(id);
  }
}