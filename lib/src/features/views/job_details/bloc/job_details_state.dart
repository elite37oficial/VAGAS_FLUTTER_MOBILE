part of 'job_details_bloc.dart';

@immutable
abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class EmptyJobDetailsState extends JobDetailsState {}

class ErroJobDetailsState extends JobDetailsState {
  final String? message;
  ErroJobDetailsState(
    this.message,
  );
}

class DescriptionjobDetailsState extends JobDetailsState {
  final DescriptionJobEntity descriptionJob;
  DescriptionjobDetailsState({
    required this.descriptionJob,
  });
}

class LoadingJobdetailsSate extends JobDetailsState {}
