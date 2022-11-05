import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/core/error/failure.dart';
import 'package:the_movie_db/movies/domain/entities/movie_detail_entity.dart';
import 'package:the_movie_db/movies/domain/repository/base_movies_repository.dart';
import 'package:the_movie_db/movies/domain/usecases/base_usecase.dart';

class GetMovieDetailsUsecase extends BaseUsecase<MovieDetailEntity, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetailEntity>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}