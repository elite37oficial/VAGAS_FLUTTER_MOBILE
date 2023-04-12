import '../../../data/dtos/description_job_dto.dart';
import '../../entities/description_job_entity.dart';

abstract class GetDescriptionJobsRepository {
  Future <DescriptionJobDto> call(String id);
}
