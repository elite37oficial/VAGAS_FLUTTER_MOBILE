import '../../dtos/description_job_dto.dart';

abstract class GetDescriptionJobsDataSource {
  Future <DescriptionJobDto> call(String id);
}
