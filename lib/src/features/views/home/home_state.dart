// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vagas_flutter_mobile/src/domain/entities/job_entity.dart';

abstract class HomeState {}

class EmptyHomeState implements HomeState {}

class ErroHomeState implements HomeState {
  final String? message;

  ErroHomeState(this.message);
}

class ListJobsHomeState implements HomeState {
  final List<JobEntity> listJobs;
  ListJobsHomeState({required this.listJobs});
}

class LoadingHomeState implements HomeState {}
