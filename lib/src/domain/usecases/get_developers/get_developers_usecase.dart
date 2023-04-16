import 'package:vagas_flutter_mobile/src/domain/entities/develop_emtity.dart';

abstract class GetDevelopersUseCase {
  Future<List<DevelopEntity>> call();
}
