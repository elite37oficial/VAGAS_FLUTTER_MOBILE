import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_jobs/get_description_jobs_usecase.dart';

import '../../repositories/get_description_jobs/get_description_jobs_repository.dart';

class GetDescriptionJobsUseCaseImp implements GetDescriptionJobsUseCase {
  final GetDescriptionJobsRepository _getDescriptionJobsRepository;
  GetDescriptionJobsUseCaseImp(
    this._getDescriptionJobsRepository,
  );
  @override
  Future<DescriptionJobEntity> call({required int id}) async {
    return await _getDescriptionJobsRepository(id);
  }
}
