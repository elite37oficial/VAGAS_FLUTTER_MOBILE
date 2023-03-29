import 'dart:convert';

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
      // final dados = HomeJobDto.fromJson(response.data);
      List<HomeJobDto> jobs = (json.decode(response.data) as List)
          .map((data) => HomeJobDto.fromJson(data))
          .toList();
      // final String data = json.encode(response.data);
      // var dados = HomeJobDto.fromJson(data);
      print(response);
      return jobs;
    } catch (e, s) {
      print(e);
      print(s);
      return [];
    }
  }
}

// List<UserModel> users = (json.decode(response.body) as List)
//       .map((data) => UserModel.fromJson(data))
//       .toList();
