import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/helper/secure_storage_helper.dart';
import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(
      LoginEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (event.email.isEmpty || event.password.isEmpty) {
      emit(AuthFailure(message: "Invalid credentials"));
      return;
    }

    // Dummy JWT token
    final token = _generateToken();

    await SecureStorageHelper.write(LOGINKEY, token);

    emit(
      LoginSuccess(name: "Suryam"),
    );
  }

  Future<void> _onLogout(
      LogoutEvent event,
      Emitter<AuthState> emit,
      ) async {
    await SecureStorageHelper.deleteAll();
    emit(AuthInitial());
  }

  String _generateToken() {
    final random = Random();
    return List.generate(
      32, (_) => random.nextInt(36).toRadixString(36),
    ).join();
  }
}
