import 'package:dio/dio.dart';
import '../di/init_dependencies.dart';
import 'api_client.dart';

Future<void> initNetworkDependency() async {
  sl.registerLazySingleton<Dio>(() => ApiClient().instance);
}
