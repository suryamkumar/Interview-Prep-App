import 'package:dio/dio.dart';
import 'package:quiz_app/core/utils/constants/constants.dart';

import '../utils/helper/secure_storage_helper.dart';

class ApiClient {
  Dio get instance {
    final dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        
        // connectTimeout: const Duration(seconds: 15),
        // receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageHelper.read(LOGINKEY);
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }
}
