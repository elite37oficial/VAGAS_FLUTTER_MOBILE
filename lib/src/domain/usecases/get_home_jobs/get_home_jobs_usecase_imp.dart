import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_home_jobs/get_home_jobs_repository.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_home_jobs/get_home_jobs_usecase.dart';

class GetHomeJobUseCaseImp implements GetHomeJobsUseCase {
  final GetHomeJobsRepository _getHomeJobsRepository;
  GetHomeJobUseCaseImp(
    this._getHomeJobsRepository,
  );
  @override
  Future<List<HomeJobEntity>> call({String? filter}) async {
    return _getHomeJobsRepository(filter ?? null);
  }
}
