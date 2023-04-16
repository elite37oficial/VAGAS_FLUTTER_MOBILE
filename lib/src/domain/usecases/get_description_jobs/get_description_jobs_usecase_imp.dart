import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_jobs/get_description_jobs_usecase.dart';
import '../../../data/dtos/description_job_dto.dart';
import '../../repositories/get_description_jobs/get_description_jobs_repository.dart';

class GetDescriptionJobsUseCaseImp implements GetDescriptionJobsUseCase {
  final GetDescriptionJobsRepository _getDescriptionJobsRepository;
  GetDescriptionJobsUseCaseImp(
    this._getDescriptionJobsRepository,
  );
  @override
  Future<DescriptionJobDto> call({required String id}) async {
    return await _getDescriptionJobsRepository(id);
  }
}
