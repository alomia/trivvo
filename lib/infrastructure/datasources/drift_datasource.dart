import 'package:trivvo/config/database/database.dart';
import 'package:trivvo/domain/datasources/datasources.dart';
import 'package:trivvo/domain/entities/movie.dart';

class DriftDatasource implements LocalStorageDatasource {
  final AppDatabase database;

  DriftDatasource(this.database);

  @override
  Future<bool> isFavoriteMovie(String movieId) async {
    // Construir el query
    final query = database.select(database.favoriteMovies)
      ..where((tbl) => tbl.movieId.equals(movieId));

    // Ejecutar el query
    final favoriteMovie = await query.getSingleOrNull();

    return favoriteMovie != null;
  }

  @override
  Future<List<Movie>> loadFavoriteMovies({
    int limit = 10,
    int offset = 0,
  }) async {
    // Query
    final rows = database.select(database.favoriteMovies)
      ..limit(limit, offset: offset);

    // Ejcutar Query
    final favoriteMovieRows = await rows.get();

    return favoriteMovieRows
        .map(
          (movie) => Movie(
            adult: false,
            backdropPath: movie.backdropPath,
            genres: [],
            id: movie.movieId,
            originalLanguage: '',
            originalTitle: '',
            overview: '',
            popularity: 0,
            posterPath: movie.posterPath,
            releaseDate: DateTime.now(),
            title: '',
            video: false,
            voteAverage: 0,
            voteCount: 0,
          ),
        )
        .toList();
  }

  @override
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final isFavorite = await isFavoriteMovie(movie.id);

    if (isFavorite) {
      final deleteQuery = database.delete(database.favoriteMovies)
        ..where((tbl) => tbl.movieId.equals(movie.id));

      await deleteQuery.go();
      return;
    }

    await database
        .into(database.favoriteMovies)
        .insert(
          FavoriteMoviesCompanion.insert(
            movieId: movie.id,
            backdropPath: movie.backdropPath,
            posterPath: movie.posterPath,
          ),
        );
  }
}
