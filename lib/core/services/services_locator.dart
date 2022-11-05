import 'package:get_it/get_it.dart';
import 'package:the_movie_db/movies/data/data_source/movie_remote_data_source.dart';
import 'package:the_movie_db/movies/data/repository/movie_repository.dart';
import 'package:the_movie_db/movies/domain/repository/base_movies_repository.dart';
import 'package:the_movie_db/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:the_movie_db/movies/presentation/controller/movie_details_bloc.dart';
import 'package:the_movie_db/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt(), getIt()));

    // Usecase
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMoviesUsecase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUsecase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationUsecase(getIt()));

    // Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(getIt()));

    // Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}