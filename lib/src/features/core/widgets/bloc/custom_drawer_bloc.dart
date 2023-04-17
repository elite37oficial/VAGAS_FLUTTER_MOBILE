import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'custom_drawer_event.dart';
part 'custom_drawer_state.dart';

class CustomDrawerBloc extends Bloc<CustomDrawerEvent, CustomDrawerState> {
  CustomDrawerBloc() : super(InitialCustomDrawerState()) {
    on<SelectedCustomDrawerEvent>(_selectedFilters);
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

  static bool isRegimeClt = false;
  static bool isRegimePj = false;
  static bool isModalityRemote = false;
  static bool isModalityPresential = false;
  static bool isModalityHibrid = false;

  Future<void> _selectedFilters(
      SelectedCustomDrawerEvent event, Emitter<CustomDrawerState> emit) async {
    isRegimeClt = event.isRegimeClt ?? isRegimeClt;
    isRegimePj = event.isRegimePj ?? isRegimePj;
    isModalityRemote = event.isModalityRemote ?? isModalityRemote;
    isModalityPresential = event.isModalityPresential ?? isModalityPresential;
    isModalityHibrid = event.isModalityHibrid ?? isModalityHibrid;
    emit(
      SelectCustomDrawerState(
        isRegimeClt: isRegimeClt,
        isRegimePj: isRegimePj,
        isModalityRemote: isModalityRemote,
        isModalityPresential: isModalityPresential,
        isModalityHibrid: isModalityHibrid,
      ),
    );
  }
}
