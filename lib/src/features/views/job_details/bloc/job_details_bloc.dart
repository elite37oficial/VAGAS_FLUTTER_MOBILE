import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_description_jobs/mock/get_description_jobs_datasource_mock_imp.dart';
import 'package:vagas_flutter_mobile/src/data/repositories/get_description_jobs/get_description_jobs_repository_imp.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_jobs/get_description_jobs_usecase.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_jobs/get_description_jobs_usecase_imp.dart';
import '../../../../domain/entities/description_job_entity.dart';
part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  JobDetailsBloc() : super(JobDetailsInitial()) {
    on<GetJobDetailsEvent>(_jobDetails);
  }

  Future<void> _jobDetails(
      GetJobDetailsEvent event, Emitter<JobDetailsState> emit) async {
    final GetDescriptionJobsUseCase _getDescriptionJobsUseCase =
        GetDescriptionJobsUseCaseImp(
      GetDescriptionJobsRepositoryImp(
        GetDescriptionJobsDataSourceMockImp(),
      ),
    );

    emit(LoadingJobdetailsSate());
    try {
      final descriptionJob = await _getDescriptionJobsUseCase(id: event.id);
      emit(DescriptionjobDetailsState(descriptionJob: descriptionJob));
    } catch (e) {}
  }
}


// try {
//       DescriptionJobEntity descriptionJobs =
//           await _getDescriptionJobsUseCase(id: id);
//       if (descriptionJobs == null) {
//         value = EmptyJobDetailsState();
//       } else {
//         value = DescriptionjobDetailsState(descriptionJob: descriptionJobs);
//       }
//     } catch (e) {
//       value = ErroJobDetailsState(e.toString());
//     }
