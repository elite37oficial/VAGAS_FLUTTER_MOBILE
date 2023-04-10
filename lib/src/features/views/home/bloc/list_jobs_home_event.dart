part of 'list_jobs_home_bloc.dart';

@immutable
abstract class ListJobsHomeEvent {}

class InitialJobsHomeEvent extends ListJobsHomeEvent {}

class GetListJobsHomeEvent extends ListJobsHomeEvent {}
