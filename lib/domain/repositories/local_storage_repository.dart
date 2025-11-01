import 'package:trivvo/domain/entities/entities.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavoriteMovie(Movie movie);
  Future<bool> isFavoriteMovie(String movieId);
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, int offset = 0});
}
