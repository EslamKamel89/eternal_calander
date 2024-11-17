import 'package:dio/dio.dart';
import 'package:eternal_calander/core/api_service/api_consumer.dart';
import 'package:eternal_calander/core/api_service/dio_consumer.dart';
import 'package:eternal_calander/homepage/data/data_source/home_remote_data_source.dart';
import 'package:eternal_calander/homepage/data/repo/repo_imp.dart';
import 'package:eternal_calander/homepage/domain/repo/repo.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future initServiceLocator() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: serviceLocator()));
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(api: serviceLocator()));
  serviceLocator.registerLazySingleton<HomeRepo>(() => HomeRepoImp(homeRemoteDataSource: serviceLocator()));
}
