import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_job_event.dart';
part 'report_job_state.dart';

class ReportJobBloc extends Bloc<ReportJobEvent, ReportJobState> {
  ReportJobBloc() : super(InitialReportJobState()) {
    on<SelectedReportJobEvent>(_selectedReport);
  }
  Future<void> _selectedReport(
      SelectedReportJobEvent event, Emitter<ReportJobState> emit) async {
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
}
