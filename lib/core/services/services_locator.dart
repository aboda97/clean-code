import 'package:get_it/get_it.dart';
import 'package:movie_app/movies_modules/data_layer/data_sources/remote_data/movie_remote_data_source.dart';
import 'package:movie_app/movies_modules/data_layer/repositories/movie_repo_data.dart';
import 'package:movie_app/movies_modules/domain_layer/repositories/movie_base_repo_domain.dart';
import 'package:movie_app/movies_modules/domain_layer/use_cases/get_now_playing_use_case.dart';
import 'package:movie_app/movies_modules/domain_layer/use_cases/get_popular_use_case.dart';
import 'package:movie_app/movies_modules/domain_layer/use_cases/get_top_rated_use_case.dart';
import 'package:movie_app/movies_modules/presentation_layer/controller/movies_bloc.dart';

GetIt serviceLocator = GetIt.instance;

class ServicesLocator {
  void init() {
    /// CREATE OBJECT OF BLOC
    serviceLocator.registerFactory(() => MoviesBloc(
          serviceLocator(),
          serviceLocator(),
          serviceLocator(),
        ));

    /// CREATE OBJECT OF USE CASES
    serviceLocator
        .registerLazySingleton(() => GetNowPlayingUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetPopularUseCase(serviceLocator()));
    serviceLocator
        .registerLazySingleton(() => GetTopRatedUseCase(serviceLocator()));

    /// CREATE OBJECT OF REPOSITORY
    serviceLocator.registerLazySingleton<MovieBaseRepoDomain>(
        () => MovieRepoData(serviceLocator()));

    /// CREATE OBJECT OF DATA SOURCE
    serviceLocator.registerLazySingleton<MovieBaseRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
