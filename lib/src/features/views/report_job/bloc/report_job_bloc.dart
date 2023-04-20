import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/post_report_job/dio/post_report_job_datasource_dio_imp.dart';
import 'package:vagas_flutter_mobile/src/data/repositories/post_report_job/post_report_job_repository_imp.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/post_report_job/post_report_job_usecase.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/post_report_job/post_report_jobs_usecase_imp.dart';
import 'package:vagas_flutter_mobile/src/features/core/model/report_options.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_dialog.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/custom_dialog_buttom.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/styles/app_colors.dart';
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

  String textReportJob(
      {required List<ReportModel> reportsListText,
      required String otherReportText}) {
    String textReport = "";
    for (var i = 0; i < reportsListText.length - 1; i++) {
      if (reportsListText[i].isSelect == true) {
        textReport += "${reportsListText[i].title}, ";
      }
    }
    if (reportsListText[6].isSelect == true) {
      textReport += "${otherReportText} ";
    }
    if (textReport.endsWith(" ")) {
      textReport = textReport.substring(0, textReport.length - 1);
    }
    return textReport;
  }

  bool allPermission(
      {required bool isPermission,
      required String textController,
      required List<ReportModel> reportsListText}) {
    if (isPermission == true) {
      if (reportsListText[6].isSelect == true && textController == "") {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Future<void> submit({
    required String textController,
    required List<ReportModel> reportsListText,
    required String jobId,
    required BuildContext context,
  }) async {
    if (allPermission(
            isPermission: isPermission,
            textController: textController,
            reportsListText: reportsListText) ==
        true) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => CustomDialog());

      final int response = await postReport(
        jobId: jobId,
        description: textReportJob(
          reportsListText: reportsListText,
          otherReportText: textController,
        ),
      );
      Navigator.of(context).pop();
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CustomDialogButton(
          isSucess: response == 201,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.greyDark,
          content: Text(
            reportsListText[6].isSelect
                ? "Preencha o campo em branco"
                : "Escolha pelo menos um item.",
            style: context.textStyles.textInterRegular
                .copyWith(fontSize: 15, color: AppColors.white),
          ),
        ),
      );
    }
  }

  Future<int> postReport(
      {required String jobId, required String description}) async {
    final PostReportJobUseCase _postReportJobUseCase = PostReportJobuseCaseImp(
      PostReportJobRepositoryImp(
        PostReportJobDataSourceDioImp(),
      ),
    );

    final int response =
        await _postReportJobUseCase(jobId: jobId, description: description);

    return response;
  }
}
