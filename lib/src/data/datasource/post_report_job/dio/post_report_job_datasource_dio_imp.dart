import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/post_report_job/post_report_job_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/report_job_dto.dart';
import 'package:vagas_flutter_mobile/src/features/core/constants/constant.dart';

class PostReportJobDataSourceDioImp implements PostReportJobDataSource {
  @override
  Future<int> call({required String jobId, required String description}) async {
    Dio dio = Dio();

    String urlReport = "${Constant.baseUrlJobs}-report";

    Map<String, dynamic> data =
        ReportJobDto(jobId: jobId, description: description).toMap();
    Response response = await dio.post(urlReport, data: data);

    return response.statusCode!;
  }
}
