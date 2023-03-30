import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';

import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_jobs/get_description_jobs_usecase.dart';
import 'package:vagas_flutter_mobile/src/features/views/job_details/job_details_state.dart';

class JobDetailController extends ValueNotifier<JobDetailsState> {
  final GetDescriptionJobsUseCase _getDescriptionJobsUseCase;
  JobDetailController(
    this._getDescriptionJobsUseCase,
  ) : super(LoadingJobdetailsSate());

  Future<void> getDetails({required String id}) async {
    try {
      DescriptionJobEntity descriptionJobs =
          await _getDescriptionJobsUseCase(id: id);
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
