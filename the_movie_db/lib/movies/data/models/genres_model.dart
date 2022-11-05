import 'package:the_movie_db/movies/domain/entities/genres_entity.dart';

class GenresModel extends GenresEntity {

  const GenresModel({
    required super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'],
      name: json['name'],
    );
  }

}