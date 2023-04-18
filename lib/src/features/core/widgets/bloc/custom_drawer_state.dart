part of 'custom_drawer_bloc.dart';

@immutable
abstract class CustomDrawerState {}

class IsEmptyCustomDrawerState extends CustomDrawerState {}

class InitialCustomDrawerState extends CustomDrawerState {}

class LoadingCustomDrawerState extends CustomDrawerState {}

class SelectCustomDrawerState extends CustomDrawerState {
  final bool isRegimeClt;
  final bool isRegimePj;
  final bool isModalityRemote;
  final bool isModalityPresential;
  final bool isModalityHibrid;
  final String cityFilter;
  SelectCustomDrawerState({
    required this.isRegimeClt,
    required this.isRegimePj,
    required this.isModalityRemote,
    required this.isModalityPresential,
    required this.isModalityHibrid,
    required this.cityFilter,
  });
}
