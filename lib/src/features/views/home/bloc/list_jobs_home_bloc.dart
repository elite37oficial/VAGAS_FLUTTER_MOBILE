import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_home_jobs/get_home_jobs_usecase.dart';
import '../../../../data/datasource/get_home_jobs/dio/get_home_jobs_datasource_dio_imp.dart';
import '../../../../data/datasource/get_home_jobs/mock/get_home_jobs_datasource_mock_imp.dart';
import '../../../../data/repositories/get_home_jobs/get_home_jobs_repository_imp.dart';
import '../../../../domain/entities/home_job_entity.dart';
import '../../../../domain/usecases/get_home_jobs/get_home_jobs_usecase_imp.dart';
part 'list_jobs_home_event.dart';
part 'list_jobs_home_state.dart';

class ListJobsHomeBloc extends Bloc<ListJobsHomeEvent, ListJobsHomeState> {
  ListJobsHomeBloc() : super(ListJobsHomeInitialState()) {
    on<GetListJobsHomeEvent>(_listJobs);
  }

  List<HomeJobEntity> listJobs = [];

  Future<void> _listJobs(
      GetListJobsHomeEvent event, Emitter<ListJobsHomeState> emit) async {
    final GetHomeJobsUseCase _getHomeJobsUseCase = GetHomeJobUseCaseImp(
      GetHomeJobsRepositoryImp(
        GetHomeJobsDataSourceDioImp(),
      ),
    );

    emit(ListJobsHomeLoadingState());
    try {
      listJobs = await _getHomeJobsUseCase(filter: event.filter ?? null);
      emit(ListJobsHomeCompletedState(listJobs: listJobs));
    } catch (e) {
      emit(ListJobsHomeErrorState());
    }
  }
}
