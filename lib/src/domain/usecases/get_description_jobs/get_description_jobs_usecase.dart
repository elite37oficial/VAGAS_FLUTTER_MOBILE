import '../../entities/description_job_entity.dart';

abstract class GetDescriptionJobsUseCase {
  Future<DescriptionJobEntity> call({required String id});
}
