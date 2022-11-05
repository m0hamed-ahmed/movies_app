import 'package:dartz/dartz.dart';
import 'package:the_movie_db/core/error/exceptions.dart';
import 'package:the_movie_db/core/error/failure.dart';
import 'package:the_movie_db/movies/data/data_source/movie_remote_data_source.dart';
import 'package:the_movie_db/movies/domain/entities/movie_detail_entity.dart';
import 'package:the_movie_db/movies/domain/entities/movie_entity.dart';
import 'package:the_movie_db/movies/domain/entities/recommendation_entity.dart';
import 'package:the_movie_db/movies/domain/repository/base_movies_repository.dart';
import 'package:the_movie_db/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_recommendation_usecase.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation(RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}