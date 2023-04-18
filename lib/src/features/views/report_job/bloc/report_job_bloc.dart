import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/post_report_job/dio/post_report_job_datasource_dio_imp.dart';
import 'package:vagas_flutter_mobile/src/data/repositories/post_report_job/post_report_job_repository_imp.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/post_report_job/post_report_job_usecase.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/post_report_job/post_report_jobs_usecase_imp.dart';

part 'report_job_event.dart';
part 'report_job_state.dart';

class ReportJobBloc extends Bloc<ReportJobEvent, ReportJobState> {
  ReportJobBloc() : super(InitialReportJobState()) {
    on<SelectedReportJobEvent>(_selectedReport);
  }

  static var isPermission = false;

  Future<void> _selectedReport(
      SelectedReportJobEvent event, Emitter<ReportJobState> emit) async {
    if (event.isReportDescription == false &&
        event.isReportFraud == false &&
        event.isReportDescrimination == false &&
        event.isReportUnfairSalary == false &&
        event.isReportUnrealiableCompany == false &&
        event.isReportError == false &&
        event.isReportOther == false) {
      isPermission = false;
    } else {
      isPermission = true;
    }
    emit(
      SelectedReportJobState(
        isReportDescription: event.isReportDescription ?? false,
        isReportFraud: event.isReportFraud ?? false,
        isReportDescrimination: event.isReportDescrimination ?? false,
        isReportUnfairSalary: event.isReportUnfairSalary ?? false,
        isReportUnrealiableCompany: event.isReportUnrealiableCompany ?? false,
        isReportError: event.isReportError ?? false,
        isReportOther: event.isReportOther ?? false,
      ),
    );
  }

  Future<void> postReport(
      {required String jobId, required String description}) async {
    final PostReportJobUseCase _postReportJobUseCase = PostReportJobuseCaseImp(
      PostReportJobRepositoryImp(
        PostReportJobDataSourceDioImp(),
      ),
    );

    _postReportJobUseCase(jobId: jobId, description: description);
  }
}
