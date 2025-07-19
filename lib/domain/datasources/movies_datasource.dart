import 'package:trivvo/domain/entities/entities.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> fetchNowPlaying({int page = 1});
  Future<List<Genre>> fetchMovieGenres();
}
