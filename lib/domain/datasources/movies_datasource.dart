import 'package:trivvo/domain/entities/entities.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> fetchUpcoming({int page = 1});
  Future<List<Movie>> fetchTopRated({int page = 1});
  Future<List<Movie>> fetchNowPlaying({int page = 1});
  Future<List<Genre>> fetchMovieGenres();

  Future<Movie> fetchMovieDetails(String movieId);
  Future<List<Cast>> fetchMovieCredits(String movieId);
  Future<List<Movie>> fetchRecommendedMovies(String movieId);
}
