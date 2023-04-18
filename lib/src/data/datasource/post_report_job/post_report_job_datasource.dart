abstract class PostReportJobDataSource {
  Future<int> call({
    required String jobId,
    required String description,
  });
}
