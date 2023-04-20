part of 'custom_drawer_bloc.dart';

@immutable
abstract class CustomDrawerEvent {}

class ChangeCityNameDrawerEvent extends CustomDrawerEvent {
  List<String> cityNamesList;
  ChangeCityNameDrawerEvent({
    required this.cityNamesList,
  });
}

class SelectedCustomDrawerEvent extends CustomDrawerEvent {
  final bool? isRegimeClt;
  final bool? isRegimePj;
  final bool? isModalityRemote;
  final bool? isModalityPresential;
  final bool? isModalityHibrid;
  final String? cityFilter;
  SelectedCustomDrawerEvent({
    this.isRegimeClt,
    this.isRegimePj,
    this.isModalityRemote,
    this.isModalityPresential,
    this.isModalityHibrid,
    this.cityFilter,
  });
}
