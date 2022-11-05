part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetailEntity? movieDetailsEntity;
  final RequestStates movieDetailsState;
  final String movieDetailsMessage;
  final List<RecommendationEntity> recommendationEntity;
  final RequestStates recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetailsEntity,
    this.movieDetailsState = RequestStates.loading,
    this.movieDetailsMessage = '',
    this.recommendationEntity = const [],
    this.recommendationState = RequestStates.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetailEntity? movieDetailsEntity,
    RequestStates? movieDetailsState,
    String? movieDetailsMessage,
    List<RecommendationEntity>? recommendationEntity,
    RequestStates? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationEntity: recommendationEntity ?? this.recommendationEntity,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetailsEntity, movieDetailsState, movieDetailsMessage,
    recommendationEntity, recommendationState, recommendationMessage,
  ];
}