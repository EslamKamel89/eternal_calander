import 'package:dio/dio.dart';
import 'package:eternal_calander/core/api_service/api_consumer.dart';
import 'package:eternal_calander/core/api_service/dio_consumer.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future initServiceLocator() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: serviceLocator()));
}
