import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';


final getItInstance = GetIt.I;

Future<void> initGetIt() async {
  if (kDebugMode) {
    // initializeLogger();
  }

  getItInstance
    ..registerSingleton<DioClient>(
      DioClient(host, Dio()),
    )
    ..registerSingleton<AppSharedPreferences>(
      AppSharedPreferences(),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepository(getItInstance()),
    )
    ..registerLazySingleton<{{app_name.pascalCase()}}AppInfoService>(
      () => {{app_name.pascalCase()}}AppInfoService()..initialize(),
    );
}

