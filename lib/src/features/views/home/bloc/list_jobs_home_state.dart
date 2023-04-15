// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_jobs_home_bloc.dart';

@immutable
abstract class ListJobsHomeState {}

class ListJobsHomeInitialState extends ListJobsHomeState {}

class ListJobsHomeEmptyState extends ListJobsHomeState {}

class ListJobsHomeErrorState extends ListJobsHomeState {}

class ListJobsHomeLoadingState implements ListJobsHomeState {}

class ListJobsHomeCompletedState extends ListJobsHomeState {
  final List<HomeJobEntity> listJobs;
  final bool? filterAppBar;

  ListJobsHomeCompletedState({required this.listJobs, this.filterAppBar});
}

class SelectedFilterAppBarState implements ListJobsHomeState {
  final bool filterAppBar;
  SelectedFilterAppBarState({
    required this.filterAppBar,
  });
}
