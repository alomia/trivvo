import 'package:trivvo/domain/datasources/datasources.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/domain/repositories/repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> fetchNowPlaying({int page = 1}) {
    return datasource.fetchNowPlaying(page: page);
  }

  @override
  Future<List<Genre>> fetchMovieGenres() {
    return datasource.fetchMovieGenres();
  }

  @override
  Future<List<Movie>> fetchTopRated({int page = 1}) {
    return datasource.fetchTopRated();
  }

  @override
  Future<List<Movie>> fetchUpcoming({int page = 1}) {
    return datasource.fetchUpcoming();
  }
  
  @override
  Future<Movie> fetchMovieDetails(String movieId) {
    return datasource.fetchMovieDetails(movieId);
  }
  
  @override
  Future<List<Cast>> fetchMovieCredits(String movieId) {
    return datasource.fetchMovieCredits(movieId);
  }
}
