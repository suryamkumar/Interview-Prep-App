
import '../../../core/di/init_dependencies.dart';
import '../history/repository/attempt_repository.dart';
import 'bloc/question_detail_bloc.dart';

Future<void> initQuestionDetailDependencies() async {
  sl.registerFactory(() => QuestionDetailBloc(sl<AttemptRepository>()),);
}
