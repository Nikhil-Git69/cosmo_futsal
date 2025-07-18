
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:cosmo_futsal/features/auth/Login/services/login_services.dart';

final getIt = GetIt.instance;

Future<void> diSetUp() async {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<TestLoginService>(() => TestLoginService(getIt<Dio>()));

}
