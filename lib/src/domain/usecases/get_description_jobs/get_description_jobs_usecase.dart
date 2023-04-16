import '../../../data/dtos/description_job_dto.dart';

abstract class GetDescriptionJobsUseCase {
  Future<DescriptionJobDto> call({required String id});
}
