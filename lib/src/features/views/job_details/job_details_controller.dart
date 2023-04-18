import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_job/get_description_job_usecase.dart';
import 'package:vagas_flutter_mobile/src/features/views/job_details/job_details_state.dart';

class JobDetailController extends ValueNotifier<JobDetailsState> {
  final GetDescriptionJobUseCase _GetDescriptionJobUseCase;
  JobDetailController(
    this._GetDescriptionJobUseCase,
  ) : super(LoadingJobdetailsSate());

  Future<void> getDetails({required String id}) async {
    try {
      DescriptionJobEntity descriptionJobs =
          (await _GetDescriptionJobUseCase(id: id)) as DescriptionJobEntity;
      if (descriptionJobs == null) {
        value = EmptyJobDetailsState();
      } else {
        value = DescriptionjobDetailsState(descriptionJob: descriptionJobs);
      }
    } catch (e) {
      value = ErroJobDetailsState(e.toString());
    }
  }
}
