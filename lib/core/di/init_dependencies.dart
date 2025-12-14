import 'package:get_it/get_it.dart';
import '../../presentaion/auth/auth_dependency.dart';
import '../../presentaion/feedback/question_detail_dependencies.dart';
import '../../presentaion/history/attempt_dependencies.dart';
import '../../presentaion/home/home_dependencies.dart';
import '../network/network_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await initNetworkDependency();
  await initAuthDependencies();
  await initHomeDependencies();
  await initQuestionDetailDependencies();
  await initAttemptDependencies();

}
