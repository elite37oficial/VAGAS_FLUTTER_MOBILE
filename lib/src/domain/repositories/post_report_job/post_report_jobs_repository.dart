abstract class PostReportJobRepository {
  Future<int> call({
    required String jobId,
    required String description,
  });
}
