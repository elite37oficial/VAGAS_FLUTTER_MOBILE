// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vagas_flutter_mobile/src/domain/entities/develop_emtity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_developers/get_developers_repository.dart';

import 'get_developers_usecase.dart';

class GetDevelopersUseCaseImp implements GetDevelopersUseCase {
  final GetDevelopersRepository _developersRepository;
  GetDevelopersUseCaseImp(
    this._developersRepository,
  );
  @override
  Future<List<DevelopEntity>> call() async {
    return _developersRepository();
  }
}
