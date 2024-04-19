import 'package:bookly/core/api_service.dart';
import 'package:bookly/features/home/data/repo/home_repo_implement.dart';
import 'package:bookly/features/home/data/repo/search_repo.dart';
import 'package:bookly/features/home/data/repo/search_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      apiService: getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
