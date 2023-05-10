import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/description_job_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_job/get_description_job_usecase.dart';
import 'package:vagas_flutter_mobile/src/features/views/job_details/job_details_state.dart';

class JobDetailController extends ValueNotifier<JobDetailsState> {
  final GetDescriptionJobUseCase _getDescriptionJobUseCase;
  JobDetailController(
    this._getDescriptionJobUseCase,
  ) : super(LoadingJobdetailsSate());

  Future<void> getDetails({required String id}) async {
    try {
      DescriptionJobEntity descriptionJobs =
          (await _getDescriptionJobUseCase(id: id));
      if (descriptionJobs.id == "") {
        value = EmptyJobDetailsState();
      } else {
        value = DescriptionjobDetailsState(descriptionJob: descriptionJobs);
      }
    } catch (e) {
      value = ErroJobDetailsState(e.toString());
    }
  }

  Future<void> openWhatsApp({required String tel}) async {
    var whatsappUrl =
        "whatsapp://send?phone=$tel&text=Olá, tudo bem? Vi a vaga que você está oferecendo no aplicativo AppVagas e estou muito interessado nela, como posso me candidatar? Aguardo seu retorno. Obrigado!";

    final uri = Uri.parse(whatsappUrl);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $whatsappUrl');
    }
  }

  Future<void> openEmail({required String email}) async {
    String email = Uri.encodeComponent("mail@fluttercampus.com");
    String subject = Uri.encodeComponent("Hello Flutter");
    String body = Uri.encodeComponent("Hi! I'm Flutter Developer");

    Uri uri = Uri.parse("mailto:$email?subject=$subject&body=$body");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
