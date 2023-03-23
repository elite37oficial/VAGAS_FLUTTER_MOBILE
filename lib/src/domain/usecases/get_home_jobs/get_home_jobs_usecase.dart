import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';

abstract class GetHomeJobsUseCase {
  Future<List<HomeJobEntity>> call();
}
