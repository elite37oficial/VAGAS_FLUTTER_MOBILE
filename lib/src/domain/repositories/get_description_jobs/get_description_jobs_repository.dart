import '../../entities/description_job_entity.dart';

abstract class GetDescriptionJobsRepository {
  Future<DescriptionJobEntity> call(int id);
}
