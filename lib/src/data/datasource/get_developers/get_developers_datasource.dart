import 'package:vagas_flutter_mobile/src/data/dtos/develop_dto.dart';

abstract class GetDevelopersDataSource {
  Future<List<DevelopDto>> call();
}
