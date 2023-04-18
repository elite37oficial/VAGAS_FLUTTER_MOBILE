import '../../../domain/repositories/get_description_job/get_description_job_repository.dart';
import '../../datasource/get_description_job/get_description_job_datasource.dart';
import '../../dtos/description_job_dto.dart';

class GetDescriptionJobRepositoryImp implements GetDescriptionJobRepository {
  final GetDescriptionJobDataSource _getDescriptionJobDataSource;

  GetDescriptionJobRepositoryImp(this._getDescriptionJobDataSource);
  @override
  Future<DescriptionJobDto> call(String id) async {
    return await _getDescriptionJobDataSource(id);
  }
}
