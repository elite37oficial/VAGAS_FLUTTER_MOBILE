import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';

abstract class JobDetailsState {}

class EmptyJobDetailsState implements JobDetailsState {}

class ErroJobDetailsState implements JobDetailsState {
  final String? message;
  ErroJobDetailsState(
    this.message,
  );
}

class DescriptionjobDetailsState implements JobDetailsState {
  final DescriptionJobEntity descriptionJob;
  DescriptionjobDetailsState({
    required this.descriptionJob,
  });
}

class LoadingJobdetailsSate implements JobDetailsState {}
