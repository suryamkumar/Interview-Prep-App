import '../../../core/di/init_dependencies.dart';
import 'bloc/home_bloc.dart';
import 'repository/question_repository.dart';

Future<void> initHomeDependencies() async {
  sl.registerLazySingleton<QuestionRepository>(() => DummyQuestionRepository(),);
  sl.registerFactory(() => HomeBloc(sl<QuestionRepository>()));
}
