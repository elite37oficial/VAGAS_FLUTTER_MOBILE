import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';

abstract class GetHomeJobsDataSource {
  Future<List<HomeJobDto>> call({
    String? filter,
    String? cityFilter,
    String? modalityFilter,
    String? regimeFilter,
  });
}
