import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vagas_flutter_mobile/src/features/views/home/home_controller.dart';

import '../../../../data/datasource/get_home_jobs/dio/get_home_jobs_datasource_dio_imp.dart';
import '../../../../data/repositories/get_home_jobs/get_home_jobs_repository_imp.dart';
import '../../../../domain/entities/home_job_entity.dart';
import '../../../../domain/usecases/get_home_jobs/get_home_jobs_usecase_imp.dart';

part 'list_jobs_home_event.dart';
part 'list_jobs_home_state.dart';

class ListJobsHomeBloc extends Bloc<ListJobsHomeEvent, ListJobsHomeState> {
  ListJobsHomeBloc() : super(ListJobsHomeInitial()) {
    on<ListJobsHome>(_listVagas);
  }

  Future<void> _listVagas(
      ListJobsHome event, Emitter<ListJobsHomeState> emit) async {
    final HomeController _homeController = HomeController(
      GetHomeJobUseCaseImp(
        GetHomeJobsRepositoryImp(
          GetHomeJobsDataSourceDioImp(),
        ),
      ),
    );
    emit(ListJobsHomeLoading());
    try {
      final List<HomeJobEntity> listJobs = await _homeController.getJobs();
      emit(ListJobsHomeCompleted(listJobs: listJobs));
    } catch (e) {
      emit(ListJobsHomeError());
    }
  }
}
