import '../../../data/dtos/description_job_dto.dart';

abstract class GetDescriptionJobsRepository {
  Future<DescriptionJobDto> call(String id);
}
