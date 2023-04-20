// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'custom_drawer_bloc.dart';

@immutable
abstract class CustomDrawerState {}

class IsEmptyCustomDrawerState extends CustomDrawerState {}

class InitialCustomDrawerState extends CustomDrawerState {}

class LoadingCustomDrawerState extends CustomDrawerState {}

class ChangeCityNameCustomDrawerState extends CustomDrawerState {
  final List<String> cityNamesList;
  ChangeCityNameCustomDrawerState({
    required this.cityNamesList,
  });
}

class SelectCustomDrawerState extends CustomDrawerState {
  final bool isRegimeClt;
  final bool isRegimePj;
  final bool isModalityRemote;
  final bool isModalityPresential;
  final bool isModalityHibrid;
  final String cityFilter;
  final List<CityEntity> cityList;
  SelectCustomDrawerState({
    required this.isRegimeClt,
    required this.isRegimePj,
    required this.isModalityRemote,
    required this.isModalityPresential,
    required this.isModalityHibrid,
    required this.cityFilter,
    required this.cityList,
  });
}
