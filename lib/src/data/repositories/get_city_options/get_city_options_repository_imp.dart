// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:vagas_flutter_mobile/src/data/datasource/get_city_options/get_city_options_datasource.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/states_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_city_options/get_city_options_repository.dart';

class GetCityOptionsRepositoryImp implements GetCityOptionsRepository {
  final GetCityOptionsDataSource _getCityOptionsDataSource;
  GetCityOptionsRepositoryImp(
    this._getCityOptionsDataSource,
  );
  @override
  Future<List<StateEntity>> call({required String filter}) async {
    return _getCityOptionsDataSource(filter: filter);
  }
}
