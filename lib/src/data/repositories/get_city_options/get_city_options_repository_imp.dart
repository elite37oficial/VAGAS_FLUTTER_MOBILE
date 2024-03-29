import 'package:vagas_flutter_mobile/src/data/datasource/get_city_options/get_city_options_datasource.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/city_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_city_options/get_city_options_repository.dart';

class GetCityOptionsRepositoryImp implements GetCityOptionsRepository {
  final GetCityOptionsDataSource _getCityOptionsDataSource;
  GetCityOptionsRepositoryImp(
    this._getCityOptionsDataSource,
  );
  @override
  Future<List<CityEntity>> call({String? cityFilter}) async {
    return _getCityOptionsDataSource(cityFilter: cityFilter);
  }
}
