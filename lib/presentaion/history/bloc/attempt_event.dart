part of 'attempt_bloc.dart';

@immutable
sealed class AttemptEvent {}

final class LoadAttemptsEvent extends AttemptEvent {}
