import 'package:vagas_flutter_mobile/src/data/dtos/state_dto.dart';

abstract class GetCityOptionsDataSource {
  Future<List<CityDto>> call({String? cityFilter});
}
