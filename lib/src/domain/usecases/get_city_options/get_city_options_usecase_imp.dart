import 'package:vagas_flutter_mobile/src/domain/entities/states_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_city_options/get_city_options_repository.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_city_options/get_city_options_usecase.dart';

class GetCityOptionsUseCaseImp implements GetCityOptionsUseCase {
  final GetCityOptionsRepository _getCityOptionsRepository;
  GetCityOptionsUseCaseImp(
    this._getCityOptionsRepository,
  );
  @override
  Future<List<StateEntity>> call({required String filter}) async {
    return _getCityOptionsRepository(filter: filter);
  }
}
