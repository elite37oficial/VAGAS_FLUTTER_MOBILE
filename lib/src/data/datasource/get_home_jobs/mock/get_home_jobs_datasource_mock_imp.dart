import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';
import '../get_home_jobs_datasource.dart';
import 'mock_home_jobs.dart';

class GetHomeJobsDataSourceMockImp implements GetHomeJobsDataSource {
  @override
  Future<List<HomeJobDto>> call() async {
    final listJobs = await mockHomeJobs;
    return listJobs;
  }
}
