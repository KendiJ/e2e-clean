import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:epam_test/src/data/datasources/remote_datasource/news_api_service.dart';
import 'package:epam_test/src/data/repositories/api_repository_impl.dart';
import 'package:epam_test/src/domain/repositories/api_repository.dart';
import 'package:get_it/get_it.dart';


final locator = GetIt.instance;

Future<void> initializeDependecies() async{
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<NewsApiService> (
    NewsApiService(locator<Dio>())
  );

  locator.registerSingleton<ApiRepository> (
    ApiRepositoryImpl(locator<NewsApiService>())
  );

}