import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_home_jobs/get_home_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';
import 'package:vagas_flutter_mobile/src/features/core/constants/constant.dart';

class GetHomeJobsDataSourceDioImp implements GetHomeJobsDataSource {
  @override
  Future<List<HomeJobDto>> call(String? filter) async {
    Dio dio = Dio();
    try {
      String urlJobs = Constant.baseUrlJobs;
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
