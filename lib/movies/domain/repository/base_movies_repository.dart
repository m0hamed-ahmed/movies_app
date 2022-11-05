import 'package:dartz/dartz.dart';
import 'package:the_movie_db/core/error/failure.dart';
import 'package:the_movie_db/movies/domain/entities/movie_detail_entity.dart';
import 'package:the_movie_db/movies/domain/entities/movie_entity.dart';
import 'package:the_movie_db/movies/domain/entities/recommendation_entity.dart';
import 'package:the_movie_db/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation(RecommendationParameters parameters);
}