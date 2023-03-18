import 'package:vagas_flutter_mobile/src/data/datasource/get_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/mock/get_jobs/mock_job.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/job_dto.dart';

class GetJobsDataSourceMockImp implements GetJobsDataSource {
  @override
  Future<List<JobDto>> call() async {
    final listJobs = await mockJob;
    return listJobs;
  }
}
