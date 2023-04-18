// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vagas_flutter_mobile/src/data/datasource/post_report_job/post_report_job_datasource.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/post_report_job/post_report_jobs_repository.dart';

class PostReportJobRepositoryImp implements PostReportJobRepository {
  final PostReportJobDataSource _postReportJobDataSource;
  PostReportJobRepositoryImp(
    this._postReportJobDataSource,
  );
  @override
  Future<int> call({required String jobId, required String description}) async {
    return _postReportJobDataSource(description: description, jobId: jobId);
  }
}
