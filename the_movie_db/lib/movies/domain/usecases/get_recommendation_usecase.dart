import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:the_movie_db/core/error/failure.dart';
import 'package:the_movie_db/movies/domain/entities/recommendation_entity.dart';
import 'package:the_movie_db/movies/domain/repository/base_movies_repository.dart';
import 'package:the_movie_db/movies/domain/usecases/base_usecase.dart';

class GetRecommendationUsecase extends BaseUsecase<List<RecommendationEntity>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}