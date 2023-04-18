import '../../../data/dtos/description_job_dto.dart';

abstract class GetDescriptionJobUseCase {
  Future<DescriptionJobDto> call({required String id});
}
