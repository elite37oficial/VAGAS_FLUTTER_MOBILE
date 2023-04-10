part of 'list_jobs_home_bloc.dart';

@immutable
abstract class ListJobsHomeState {}

class ListJobsHomeInitialState extends ListJobsHomeState {}

class ListJobsHomeEmptyState extends ListJobsHomeState {}

class ListJobsHomeErrorState extends ListJobsHomeState {}

class ListJobsHomeLoadingState implements ListJobsHomeState {}

class ListJobsHomeCompletedState extends ListJobsHomeState {
  final List<HomeJobEntity> listJobs;
  ListJobsHomeCompletedState({required this.listJobs});
}
