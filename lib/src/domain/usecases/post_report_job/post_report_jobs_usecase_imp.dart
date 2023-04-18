import 'package:vagas_flutter_mobile/src/domain/repositories/post_report_job/post_report_jobs_repository.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/post_report_job/post_report_job_usecase.dart';

class PostReportJobuseCaseImp implements PostReportJobUseCase {
  final PostReportJobRepository _postReportJobRepository;
  PostReportJobuseCaseImp(
    this._postReportJobRepository,
  );
  @override
  Future<int> call({required String jobId, required String description}) async {
    return _postReportJobRepository(
      jobId: jobId,
      description: description,
    );
  }
}
