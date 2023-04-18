abstract class PostReportJobUseCase {
  Future<int> call({
    required String jobId,
    required String description,
  });
}
