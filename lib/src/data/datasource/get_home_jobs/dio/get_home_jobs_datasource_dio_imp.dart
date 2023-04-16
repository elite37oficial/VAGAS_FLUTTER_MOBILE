import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_home_jobs/get_home_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';
import 'package:vagas_flutter_mobile/src/features/core/constants/constant.dart';

class GetHomeJobsDataSourceDioImp implements GetHomeJobsDataSource {
  @override
  Future<List<HomeJobDto>> call(String? filter) async {
    Dio dio = Dio();
    try {
      if (filter == null || filter == "") {
        String urlJobs = Constant.baseUrlJobs;
        final response = await dio.get(urlJobs);
        List<HomeJobDto> jobs = (response.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        return jobs;
      } else {
        String baseUrlJobsFilter = Constant.baseUrlJobs;
        String urlJobsTitle = "$baseUrlJobsFilter?title=$filter";
        String urlJobsCompanyName = "$baseUrlJobsFilter?name=$filter";
        String urlJobsCity = "$baseUrlJobsFilter?city=$filter";
        String urlJobsModality = "$baseUrlJobsFilter?modality=$filter";

        final response1 = await dio.get(urlJobsTitle);
        final response2 = await dio.get(urlJobsCompanyName);
        final response3 = await dio.get(urlJobsModality);
        final response4 = await dio.get(urlJobsCity);

        List<HomeJobDto> jobs1 = (response1.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        List<HomeJobDto> jobs2 = (response2.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        List<HomeJobDto> jobs3 = (response3.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        List<HomeJobDto> jobs4 = (response4.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();

        Set<HomeJobDto> jobs = Set<HomeJobDto>();

        jobs.addAll(jobs1);
        jobs.addAll(jobs2);
        jobs.addAll(jobs3);
        jobs.addAll(jobs4);

        final finalList = jobs.toList();
        return finalList;
      }
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }
}
