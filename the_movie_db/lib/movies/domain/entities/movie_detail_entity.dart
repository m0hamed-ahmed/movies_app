import 'package:equatable/equatable.dart';
import 'package:the_movie_db/movies/domain/entities/genres_entity.dart';

class MovieDetailEntity extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<GenresEntity> genres;

  const MovieDetailEntity({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [backdropPath, id, overview, releaseDate, runtime, title, voteAverage, genres];
}