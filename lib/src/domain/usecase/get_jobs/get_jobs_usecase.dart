import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';

abstract class GetJobsUseCase {
  Future<List<JobEntity>> call();
}
