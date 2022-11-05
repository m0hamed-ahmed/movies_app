import 'package:equatable/equatable.dart';
import 'package:the_movie_db/core/utils/enum.dart';
import 'package:the_movie_db/movies/domain/entities/movie_entity.dart';

class MoviesStates extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestStates nowPlayingState;
  final String nowPlayingMessage;
  final List<MovieEntity> popularMovies;
  final RequestStates popularState;
  final String popularMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestStates topRatedState;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestStates.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularState = RequestStates.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRatedState = RequestStates.loading,
    this.topRatedMessage = '',
  });

  MoviesStates copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestStates? nowPlayingState,
    String? nowPlayingMessage,
    List<MovieEntity>? popularMovies,
    RequestStates? popularState,
    String? popularMessage,
    List<MovieEntity>? topRatedMovies,
    RequestStates? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies, nowPlayingState, nowPlayingMessage,
    popularMovies, popularState, popularMessage,
    topRatedMovies, topRatedState, topRatedMessage,
  ];
}