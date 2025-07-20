import 'package:trivvo/domain/entities/entities.dart';

abstract class MoviesRepository {
  Future<List<Movie>> fetchUpcoming({int page = 1});
  Future<List<Movie>> fetchTopRated({int page = 1});
  Future<List<Movie>> fetchNowPlaying({int page = 1});
  Future<List<Genre>> fetchMovieGenres();
}
