import '../../entities/city_entity.dart';

abstract class GetCityOptionsRepository {
  Future<List<CityEntity>> call({String? cityFilter});
}
