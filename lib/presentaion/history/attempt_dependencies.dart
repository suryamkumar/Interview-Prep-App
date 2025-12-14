import 'package:hive/hive.dart';
import 'package:quiz_app/presentaion/history/repository/attempt_repository.dart';
import '../../../core/di/init_dependencies.dart';
import 'bloc/attempt_bloc.dart';
import 'model/attempt_model.dart';


Future<void> initAttemptDependencies() async {
  sl.registerLazySingleton<AttemptRepository>(() => HiveAttemptRepository(Hive.box<AttemptModel>('attemptsBox')));
  sl.registerFactory(() => AttemptBloc(sl<AttemptRepository>()));
}
