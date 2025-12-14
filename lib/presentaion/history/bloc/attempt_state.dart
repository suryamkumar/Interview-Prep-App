part of 'attempt_bloc.dart';

@immutable
sealed class AttemptState {}

final class AttemptInitial extends AttemptState {}

final class AttemptsLoaded extends AttemptState {
  final List<AttemptModel> attempts;

  AttemptsLoaded(this.attempts);
}
