import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vagas_flutter_mobile/src/data/datasource/get_city_options/dio/get_city_options_datasource_dio_imp.dart';
import 'package:vagas_flutter_mobile/src/data/repositories/get_city_options/get_city_options_repository_imp.dart';
import 'package:vagas_flutter_mobile/src/domain/entities/city_entity.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_city_options/get_city_options_usecase.dart';
import 'package:vagas_flutter_mobile/src/domain/usecases/get_city_options/get_city_options_usecase_imp.dart';
part 'custom_drawer_event.dart';
part 'custom_drawer_state.dart';

class CustomDrawerBloc extends Bloc<CustomDrawerEvent, CustomDrawerState> {
  CustomDrawerBloc() : super(InitialCustomDrawerState()) {
    on<SelectedCustomDrawerEvent>(_selectedFilters);
    on<ChangeCityNameDrawerEvent>(_changeCityname);
  }

  String regimeFilter({
    required String regimeFilter,
    required bool isRegimeClt,
    required bool isRegimePj,
  }) {
    if ((isRegimeClt == true && isRegimePj == true) ||
        (isRegimeClt == false && isRegimePj == false)) {
      return regimeFilter = "";
    } else {
      return regimeFilter = isRegimeClt == true ? "clt" : "pj";
    }
  }

  String modalityFilter({
    required String modalityFilter,
    required bool isModalityRemote,
    required bool isModalityPresential,
    required bool isModalityHibrid,
  }) {
    if (isModalityRemote) {
      modalityFilter += "remoto,";
    }
    if (isModalityPresential) {
      modalityFilter += "presencial,";
    }
    if (isModalityHibrid) {
      modalityFilter += "hibrido,";
    }
    if (modalityFilter.endsWith(',')) {
      modalityFilter = modalityFilter.substring(0, modalityFilter.length - 1);
    }
    return modalityFilter;
  }

  Future<List<CityEntity>> getCityOptions() async {
    GetCityOptionsUseCase _getCityOptionsUseCase = GetCityOptionsUseCaseImp(
      GetCityOptionsRepositoryImp(
        GetCityOptionsDataSourceMockImp(),
      ),
    );

    final List<CityEntity> response = await _getCityOptionsUseCase();
    return response;
  }

  static List<CityEntity> cityList = [];
  static bool isRegimeClt = false;
  static bool isRegimePj = false;
  static bool isModalityRemote = false;
  static bool isModalityPresential = false;
  static bool isModalityHibrid = false;
  static String cityFilter = "";

  Future<void> _selectedFilters(
      SelectedCustomDrawerEvent event, Emitter<CustomDrawerState> emit) async {
    emit(LoadingCustomDrawerState());

    try {
      cityList = await getCityOptions();
      isRegimeClt = event.isRegimeClt ?? isRegimeClt;
      isRegimePj = event.isRegimePj ?? isRegimePj;
      isModalityRemote = event.isModalityRemote ?? isModalityRemote;
      isModalityPresential = event.isModalityPresential ?? isModalityPresential;
      isModalityHibrid = event.isModalityHibrid ?? isModalityHibrid;
      cityFilter = event.cityFilter ?? cityFilter;
    } catch (e) {}
    emit(
      SelectCustomDrawerState(
        isRegimeClt: isRegimeClt,
        isRegimePj: isRegimePj,
        isModalityRemote: isModalityRemote,
        isModalityPresential: isModalityPresential,
        isModalityHibrid: isModalityHibrid,
        cityFilter: cityFilter,
        cityList: cityList,
      ),
    );
  }

  Future<void> _changeCityname(
      ChangeCityNameDrawerEvent event, Emitter<CustomDrawerState> emit) async {
    emit(ChangeCityNameCustomDrawerState(cityNamesList: event.cityNamesList));
  }
}
