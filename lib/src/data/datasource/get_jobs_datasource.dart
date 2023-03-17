import 'package:vagas_flutter_mobile/src/data/dtos/job_dto.dart';

abstract class GetJobsDataSource {
  Future<List<JobDto>> call();
}
