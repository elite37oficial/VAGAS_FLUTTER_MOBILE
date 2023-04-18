import 'package:vagas_flutter_mobile/src/data/dtos/state_dto.dart';

abstract class GetCityOptionsDataSource {
  Future<List<StateDto>> call({required String filter});
}
