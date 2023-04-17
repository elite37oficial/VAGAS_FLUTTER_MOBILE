import 'package:vagas_flutter_mobile/src/data/datasource/get_developers/get_developers_datasource.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/develop_emtity.dart';
import 'package:vagas_flutter_mobile/src/domain/repositories/get_developers/get_developers_repository.dart';

class GetDevelopersRepositoryImp implements GetDevelopersRepository {
  final GetDevelopersDataSource _developersDataSource;
  GetDevelopersRepositoryImp(
    this._developersDataSource,
  );
  @override
  Future<List<DevelopEntity>> call() async {
    return _developersDataSource();
  }
}
