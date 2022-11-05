import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_db/core/utils/enum.dart';
import 'package:the_movie_db/movies/domain/usecases/base_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:the_movie_db/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:the_movie_db/movies/presentation/controller/movies_events.dart';
import 'package:the_movie_db/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase, this.getTopRatedMoviesUsecase) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUsecase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(nowPlayingState: RequestStates.error, nowPlayingMessage: l.message));
    }, (r) {
      emit(state.copyWith(nowPlayingState: RequestStates.loaded, nowPlayingMovies: r));
    });
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(popularState: RequestStates.error, popularMessage: l.message));
    }, (r) {
      emit(state.copyWith(popularState: RequestStates.loaded, popularMovies: r));
    });
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(topRatedState: RequestStates.error, topRatedMessage: l.message));
    }, (r) {
      emit(state.copyWith(topRatedState: RequestStates.loaded, topRatedMovies: r));
    });
  }
}