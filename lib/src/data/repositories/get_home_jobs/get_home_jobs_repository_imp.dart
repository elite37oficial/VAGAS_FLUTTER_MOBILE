import 'package:vagas_flutter_mobile/src/data/datasource/get_home_jobs/get_home_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_home_jobs/get_home_jobs_repository.dart';

class GetHomeJobsRepositoryImp implements GetHomeJobsRepository {
  final GetHomeJobsDataSource _getHomeJobsDataSource;

  GetHomeJobsRepositoryImp(this._getHomeJobsDataSource);
  @override
  Future<List<HomeJobEntity>> call({
    String? filter,
    String? cityFilter,
    String? modalityFilter,
    String? regimeFilter,
  }) async {
    return _getHomeJobsDataSource(
      filter: filter ?? null,
      cityFilter: cityFilter ?? null,
      modalityFilter: modalityFilter ?? null,
      regimeFilter: regimeFilter ?? null,
    );
  }
}
