import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_home_jobs/get_home_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/home_job_dto.dart';
import 'package:vagas_flutter_mobile/src/features/core/constants/constant.dart';

class GetHomeJobsDataSourceDioImp implements GetHomeJobsDataSource {
  @override
  Future<List<HomeJobDto>> call({
    String? filter,
    String? cityFilter,
    String? modalityFilter,
    String? regimeFilter,
  }) async {
    String extensionFilter = "";

    if (cityFilter != null) {
      extensionFilter += "city=$cityFilter";
    }
    if (modalityFilter != null || extensionFilter.isNotEmpty) {
      extensionFilter += "&modality=$modalityFilter";
    } else if (modalityFilter != null) {
      extensionFilter += "modality=$modalityFilter";
    }
    if (regimeFilter != null || extensionFilter.isNotEmpty) {
      extensionFilter += "&regime=$regimeFilter";
    } else if (regimeFilter != null) {
      extensionFilter += "regime=$regimeFilter";
    }

    Dio dio = Dio();
    try {
      if (filter == null || filter == "") {
        String urlJobs = Constant.baseUrlJobs;
        if (cityFilter != null ||
            modalityFilter != null ||
            regimeFilter != null) {
          urlJobs = "${Constant.baseUrlJobs}?$extensionFilter";
        }
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

        final responseTitle = await dio.get(urlJobsTitle);
        final responseCompanyName = await dio.get(urlJobsCompanyName);
        final responseCity = await dio.get(urlJobsModality);
        final responseModality = await dio.get(urlJobsCity);

        List<HomeJobDto> jobsTitle = (responseTitle.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        List<HomeJobDto> jobsCompanyName = (responseCompanyName.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        List<HomeJobDto> jobsCity = (responseCity.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();
        List<HomeJobDto> jobsModality = (responseModality.data as List)
            .map((json) => HomeJobDto.fromMap(json))
            .toList();

        Set<HomeJobDto> jobs = <HomeJobDto>{};

        jobs.addAll(jobsTitle);
        jobs.addAll(jobsCompanyName);
        jobs.addAll(jobsCity);
        jobs.addAll(jobsModality);

        final finalListJobs = jobs.toList();
        return finalListJobs;
      }
    } catch (e) {
      return [];
    }
  }
}
