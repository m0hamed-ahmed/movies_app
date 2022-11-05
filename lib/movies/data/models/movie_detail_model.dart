import 'package:the_movie_db/movies/data/models/genres_model.dart';
import 'package:the_movie_db/movies/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {

  const MovieDetailModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        genres: List<GenresModel>.from(json['genres'].map((x) => GenresModel.fromJson(x))),
    );
  }

}