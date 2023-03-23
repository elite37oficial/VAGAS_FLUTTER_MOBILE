import 'package:vagas_flutter_mobile/src/domain/entities/home_job_entity.dart';

abstract class HomeState {}

class EmptyHomeState implements HomeState {}

class ErroHomeState implements HomeState {
  final String? message;

  ErroHomeState(this.message);
}

class ListJobsHomeState implements HomeState {
  final List<HomeJobEntity> listJobs;
  ListJobsHomeState({required this.listJobs});
}

class LoadingHomeState implements HomeState {}
