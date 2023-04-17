import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'custom_drawer_event.dart';
part 'custom_drawer_state.dart';

class CustomDrawerBloc extends Bloc<CustomDrawerEvent, CustomDrawerState> {
  CustomDrawerBloc() : super(InitialCustomDrawerState()) {
    on<SelectedCustomDrawerEvent>(_selectedFilters);
  }
  static bool isRegimeClt = false;
  static bool isRegimePj = false;
  static bool isModalityRemote = false;
  static bool isModalityPresencial = false;
  static bool isModalityHibrid = false;

  Future<void> _selectedFilters(
      SelectedCustomDrawerEvent event, Emitter<CustomDrawerState> emit) async {
    isRegimeClt = event.isRegimeClt ?? isRegimeClt;
    isRegimePj = event.isRegimePj ?? isRegimePj;
    isModalityRemote = event.isModalityRemote ?? isModalityRemote;
    isModalityPresencial = event.isModalityPresencial ?? isModalityPresencial;
    isModalityHibrid = event.isModalityHibrid ?? isModalityHibrid;
    emit(
      SelectCustomDrawerState(
        isRegimeClt: isRegimeClt,
        isRegimePj: isRegimePj,
        isModalityRemote: isModalityRemote,
        isModalityPresencial: isModalityPresencial,
        isModalityHibrid: isModalityHibrid,
      ),
    );
  }
}
