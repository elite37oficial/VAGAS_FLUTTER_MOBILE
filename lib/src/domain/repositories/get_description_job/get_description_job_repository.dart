
import '../../../data/dtos/description_job_dto.dart';

abstract class GetDescriptionJobRepository {
  Future<DescriptionJobDto> call(String id);
}
