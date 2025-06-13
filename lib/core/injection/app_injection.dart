import 'package:esqueleto_flutter/core/localstorage/security_shared_preference.dart';
import 'package:get_it/get_it.dart';
import '../../features/login/data/datasources/feature_datasource.dart';
import '../../features/login/data/repositories/login_repository.dart';
import '../../features/login/domain/usecases/login_usecase.dart';

import '../../features/login/presentation/controllers/login_controller.dart';
import '../http/http_client_dio.dart';
import '../http/http_client_impl.dart';

class AppInjection {
  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    getIt
      ..registerFactory<HttpClientDio>(() => HttpClientImpl())
      ..registerLazySingleton(() => SecuritySharedPreference());
  }
}
