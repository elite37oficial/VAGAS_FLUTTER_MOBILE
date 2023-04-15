// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'custom_drawer_bloc.dart';

@immutable
abstract class CustomDrawerEvent {}

class InitialCustomDrawerEvent extends CustomDrawerEvent {}

class SelectedCustomDrawerEvent extends CustomDrawerEvent {
  final bool? isRegimeClt;
  final bool? isRegimePj;
  final bool? isModalityRemote;
  final bool? isModalityPresencial;
  final bool? isModalityHibrid;
  SelectedCustomDrawerEvent({
    this.isRegimeClt,
    this.isRegimePj,
    this.isModalityRemote,
    this.isModalityPresencial,
    this.isModalityHibrid,
  });
}
