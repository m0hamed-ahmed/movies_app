import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/core/utils/enum.dart';
import 'package:the_movie_db/movies/domain/entities/movie_detail_entity.dart';
import 'package:the_movie_db/movies/domain/entities/recommendation_entity.dart';
import 'package:the_movie_db/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUsecase(MovieDetailsParameters(movieId: event.id));
    result.fold((l) {
      emit(state.copyWith(movieDetailsState: RequestStates.error, movieDetailsMessage: l.message));
    }, (r) {
      emit(state.copyWith(movieDetailsEntity: r, movieDetailsState: RequestStates.loaded));
    });
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUsecase(RecommendationParameters(id: event.id));
    result.fold((l) {
      emit(state.copyWith(recommendationState: RequestStates.error, recommendationMessage: l.message));
    }, (r) {
      emit(state.copyWith(recommendationEntity: r, recommendationState: RequestStates.loaded));
    });
  }
}