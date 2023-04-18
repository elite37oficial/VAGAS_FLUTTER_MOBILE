import 'package:vagas_flutter_mobile/src/domain/usecases/get_description_job/get_description_job_usecase.dart';
import '../../../data/dtos/description_job_dto.dart';
import '../../repositories/get_description_job/get_description_job_repository.dart';

class GetDescriptionJobUseCaseImp implements GetDescriptionJobUseCase {
  final GetDescriptionJobRepository _getDescriptionJobRepository;
  GetDescriptionJobUseCaseImp(
    this._getDescriptionJobRepository,
  );
  @override
  Future<DescriptionJobDto> call({required String id}) async {
    return await _getDescriptionJobRepository(id);
  }
}
