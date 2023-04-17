part of 'report_job_bloc.dart';

@immutable
abstract class ReportJobEvent {}

class SelectedReportJobEvent extends ReportJobEvent {
  final bool? isReportDescription;
  final bool? isReportFraud;
  final bool? isReportDescrimination;
  final bool? isReportUnfairSalary;
  final bool? isReportUnrealiableCompany;
  final bool? isReportError;
  final bool? isReportOther;
  SelectedReportJobEvent([
    this.isReportDescription,
    this.isReportFraud,
    this.isReportDescrimination,
    this.isReportUnfairSalary,
    this.isReportUnrealiableCompany,
    this.isReportError,
    this.isReportOther,
  ]);
}
