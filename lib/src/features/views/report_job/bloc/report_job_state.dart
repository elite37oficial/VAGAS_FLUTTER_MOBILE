part of 'report_job_bloc.dart';

@immutable
abstract class ReportJobState {}

class IsEmptyReportJobState extends ReportJobState {}

class InitialReportJobState extends ReportJobState {}

class LoadingReportJobState extends ReportJobState {}

class SelectedReportJobState extends ReportJobState {
  final bool isReportDescription;
  final bool isReportFraud;
  final bool isReportDescrimination;
  final bool isReportUnfairSalary;
  final bool isReportUnrealiableCompany;
  final bool isReportError;
  final bool isReportOther;

  SelectedReportJobState({
    required this.isReportDescription,
    required this.isReportFraud,
    required this.isReportDescrimination,
    required this.isReportUnfairSalary,
    required this.isReportUnrealiableCompany,
    required this.isReportError,
    required this.isReportOther,
  });
}
