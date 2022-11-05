import 'package:dartz/dartz.dart';
import 'package:the_movie_db/core/error/failure.dart';
import 'package:the_movie_db/movies/domain/entities/movie_entity.dart';
import 'package:the_movie_db/movies/domain/repository/base_movies_repository.dart';
import 'package:the_movie_db/movies/domain/usecases/base_usecase.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<MovieEntity>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}