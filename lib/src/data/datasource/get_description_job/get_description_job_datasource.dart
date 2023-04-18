
import '../../dtos/description_job_dto.dart';

abstract class GetDescriptionJobDataSource {
  Future<DescriptionJobDto> call(String id);
}
