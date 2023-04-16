import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';
import '../get_home_jobs_datasource.dart';
import 'mock_home_jobs.dart';

class GetHomeJobsDataSourceMockImp implements GetHomeJobsDataSource {
  @override
  Future<List<HomeJobDto>> call(String? filter) async {
    final listJobs = mockHomeJobs;
    if (filter == null) {
      return listJobs;
    } else {
      final filteredList = listJobs
          .where((job) =>
              job.title.toLowerCase().contains(filter.toLowerCase()) ||
              job.companyName.toLowerCase().contains(filter.toLowerCase()) ||
              job.city.toLowerCase().contains(filter.toLowerCase()) ||
              job.modality.toLowerCase().contains(filter.toLowerCase()))
          .toList();
      return filteredList;
    }
  }
}
