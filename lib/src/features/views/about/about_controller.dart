import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/develop_emtity.dart';

import 'package:vagas_flutter_mobile/src/domain/usecases/get_developers/get_developers_usecase.dart';
import 'package:vagas_flutter_mobile/src/features/views/about/about_state.dart';

class AboutController extends ValueNotifier<AboutState> {
  final GetDevelopersUseCase _getDevelopersUseCase;
  AboutController(
    this._getDevelopersUseCase,
  ) : super(LoadingDevelopersState());

  Future<void> getDevelopers() async {
    try {
      final List<DevelopEntity> listDevelopers = await _getDevelopersUseCase();
      if (listDevelopers.isEmpty) {
        value = EmptyDevelopersState();
      } else {
        value = GetDevelopersState(listDevelopers: listDevelopers);
      }
    } catch (e) {
      value = ErroDevelopersState(message: e.toString());
    }
  }

  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
