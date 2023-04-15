// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final bool isModalityPresencial;
  final bool isModalityHibrid;
  SelectCustomDrawerState({
    required this.isRegimeClt,
    required this.isRegimePj,
    required this.isModalityRemote,
    required this.isModalityPresencial,
    required this.isModalityHibrid,
  });
}
