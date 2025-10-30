import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/models/models.dart';

class GenreMapper {
  static Genre tmdbToEntity(GenreTmdb genre) =>
      Genre(id: genre.id, name: genre.name);
}
