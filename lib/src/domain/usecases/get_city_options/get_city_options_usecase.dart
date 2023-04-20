import 'package:vagas_flutter_mobile/src/domain/entities/city_entity.dart';

abstract class GetCityOptionsUseCase {
  Future<List<CityEntity>> call({String? cityFilter});
}
