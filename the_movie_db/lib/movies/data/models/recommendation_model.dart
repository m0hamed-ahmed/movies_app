import 'package:the_movie_db/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {

  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
    );
  }
}