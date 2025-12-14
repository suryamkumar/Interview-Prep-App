import 'package:quiz_app/presentaion/auth/repository/auth_repository.dart';
import '../../core/di/init_dependencies.dart';
import 'bloc/auth_bloc.dart';


Future <void> initAuthDependencies() async {
  sl.registerLazySingleton<AuthRepository>(() => DummyAuthRepository());
  sl.registerLazySingleton(() => AuthBloc(sl<AuthRepository>()));
}
