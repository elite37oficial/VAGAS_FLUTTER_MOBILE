// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vagas_flutter_mobile/src/domain/entities/develop_emtity.dart';

abstract class AboutState {}

class EmptyDevelopersState implements AboutState {}

class GetDevelopersState implements AboutState {
  final List<DevelopEntity> listDevelopers;
  GetDevelopersState({
    required this.listDevelopers,
  });
}

class LoadingDevelopersState implements AboutState {}

class ErroDevelopersState implements AboutState {
  final String message;
  ErroDevelopersState({
    required this.message,
  });
}
