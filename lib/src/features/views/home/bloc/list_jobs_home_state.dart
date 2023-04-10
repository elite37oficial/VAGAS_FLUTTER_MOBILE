part of 'list_jobs_home_bloc.dart';

@immutable
abstract class ListJobsHomeState {}

class ListJobsHomeInitial extends ListJobsHomeState {}

class ListJobsHomeEmpty extends ListJobsHomeState {}

class ListJobsHomeError extends ListJobsHomeState {}

class ListJobsHomeLoading implements ListJobsHomeState {}

class ListJobsHomeCompleted extends ListJobsHomeState {
  final List<HomeJobEntity> listJobs;
  ListJobsHomeCompleted({required this.listJobs});
}
