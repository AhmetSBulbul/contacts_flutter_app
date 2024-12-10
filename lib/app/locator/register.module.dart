import 'package:contacts_flutter_app/app/config/app_environment.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<AppEnvironment> get env => AppEnvironment.load();

  // Dio instance with apiKey header and api base Url.
  @singleton
  Dio dio(AppEnvironment env) => Dio(BaseOptions(
        baseUrl: env.apiUrl,
        headers: {
          'ApiKey': env.apiKey,
          Headers.contentTypeHeader: Headers.jsonContentType
        },
      ))
        ..interceptors.add(PrettyDioLogger(requestHeader: true));
}
