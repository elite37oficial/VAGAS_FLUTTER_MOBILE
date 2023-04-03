import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_home_jobs/get_home_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';

class GetHomeJobsDataSourceDioImp implements GetHomeJobsDataSource {
  @override
  Dio dio = Dio();
  Future<List<HomeJobDto>> call() async {
    try {
      String urlJobs = "https://apivagasdev.elite37.com.br/jobs";
      final response = await dio.get(urlJobs);
      List<HomeJobDto> jobs = await (response.data as List)
          .map((json) => HomeJobDto.fromMap(json))
          .toList();
      return jobs;
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }
}
