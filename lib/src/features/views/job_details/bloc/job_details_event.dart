part of 'job_details_bloc.dart';

@immutable
abstract class JobDetailsEvent {}

class InitialJobDetailsEvent extends JobDetailsEvent {}

class GetJobDetailsEvent extends JobDetailsEvent {
  final String id;
  GetJobDetailsEvent({
    required this.id,
  });
}
