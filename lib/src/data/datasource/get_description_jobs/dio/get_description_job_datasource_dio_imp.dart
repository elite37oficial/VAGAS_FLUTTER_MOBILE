import 'package:dio/dio.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_description_jobs/get_description_jobs_datasource.dart';
import 'package:vagas_flutter_mobile/src/data/dtos/description_job_dto.dart';
import 'package:vagas_flutter_mobile/src/features/core/constants/constant.dart';

class GetDescriptionJobDataSourceDioImp extends GetDescriptionJobsDataSource {
  @override
  Future<DescriptionJobDto> call(String id) async {
    Dio dio = Dio();
    try {
      String urlJobs = "${Constant.baseUrlJobs}/id/$id";
      final response = await dio.get(urlJobs);
      final data = response.data;
      // print(data.runtimeType);
      DescriptionJobDto jobs = DescriptionJobDto.fromMap(data);
      return jobs;
    } catch (e, s) {
      print(e);
      print(s);
      return DescriptionJobDto(
          id: ' ',
          companyId: ' ',
          nameCompany: '',
          status: '',
          title: '',
          seniority: '',
          description: '',
          descriptionCompany: '',
          salary: 0.0,
          modality: '',
          city: '',
          state: '',
          link: '',
          whatsapp: '',
          email: '',
          createdBy: '');
    }
  }
}
