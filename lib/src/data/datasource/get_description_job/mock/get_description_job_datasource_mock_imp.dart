import '../../../dtos/description_job_dto.dart';
import '../get_description_job_datasource.dart';
import 'mock_description_jobs.dart';

class GetDescriptionJobDataSourceMockImp
    implements GetDescriptionJobDataSource {
  @override
  Future<DescriptionJobDto> call(String id) async {
    final listJobs = mockDescriptionJobs;
    final item = listJobs.where((job) => job.id == id).first;
    return item;
  }
}
