part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String name;
  LoginSuccess({required this.name});
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
