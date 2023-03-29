import 'package:dio/dio.dart';

class GetJobsRepository {
  Dio dio = Dio();

  Future<void> getJobs() async {
    //Implementar o Model para ser preenchido com esse endpoint
    try {
      String urlJobs = "https://apivagasdev.elite37.com.br/jobs";
      final response = await dio.get(urlJobs);
      print(response);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  ///implementar o filtro
}
