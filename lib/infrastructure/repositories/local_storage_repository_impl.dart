import 'package:trivvo/domain/datasources/datasources.dart';
import 'package:trivvo/domain/entities/movie.dart';
import 'package:trivvo/domain/repositories/repositories.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isFavoriteMovie(String movieId) {
    return datasource.isFavoriteMovie(movieId);
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({int limit = 10, int offset = 0}) {
    return datasource.loadFavoriteMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) {
    return datasource.toggleFavoriteMovie(movie);
  }
}
