import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'report_job_event.dart';
part 'report_job_state.dart';

class ReportJobBloc extends Bloc<ReportJobEvent, ReportJobState> {
  ReportJobBloc() : super(InitialReportJobState()) {
    on<SelectedReportJobEvent>(_selectedReport);
  }

  // static bool isReportDescription = false;
  // static bool isReportFraud = false;
  // static bool isReportDescrimination = false;
  // static bool isReportUnfairSalary = false;
  // static bool isReportUnrealiableCompany = false;
  // static bool isReportError = false;
  // static bool isReportOther = false;

  Future<void> _selectedReport(
      SelectedReportJobEvent event, Emitter<ReportJobState> emit) async {
    // isReportDescription = event.isReportDescription ?? isReportDescription;
    // isReportFraud = event.isReportFraud ?? isReportFraud;
    // isReportDescrimination =
    //     event.isReportDescrimination ?? isReportDescrimination;
    // isReportUnfairSalary = event.isReportUnfairSalary ?? isReportUnfairSalary;
    // isReportUnrealiableCompany =
    //     event.isReportUnrealiableCompany ?? isReportUnrealiableCompany;
    // isReportError = event.isReportError ?? isReportError;
    // isReportOther = event.isReportOther ?? isReportOther;

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
