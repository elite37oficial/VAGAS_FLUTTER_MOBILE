part of 'list_jobs_home_bloc.dart';

@immutable
abstract class ListJobsHomeEvent {}

class InitialJobsHomeEvent extends ListJobsHomeEvent {}

class GetListJobsHomeEvent extends ListJobsHomeEvent {
  final String? filter;
  final String? cityFilter;
  final String? modalityFilter;
  final String? regimeFilter;

  GetListJobsHomeEvent({
    this.filter,
    this.cityFilter,
    this.modalityFilter,
    this.regimeFilter,
  });
}
