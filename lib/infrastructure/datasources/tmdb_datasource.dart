import 'package:dio/dio.dart';

import 'package:trivvo/config/constants/environment.dart';
import 'package:trivvo/domain/datasources/datasources.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/mappers/mappers.dart';
import 'package:trivvo/infrastructure/models/models.dart';

class TmdbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {'language': 'es-mx'},
      headers: {
        'Authorization': 'Bearer ${Environment.tmdbAPIReadAccessToken}',
      },
    ),
  );

  Future<List<Movie>> _fetchMoviesFromPath(String path) async {
    final response = await dio.get(path);

    return TmdbMovieListResponse.fromJson(
      response.data,
    ).results.map((movie) => MovieMapper.tmdbListToEntity(movie)).toList();
  }

  @override
  Future<List<Movie>> fetchNowPlaying({int page = 1}) {
    return _fetchMoviesFromPath('/movie/now_playing');
  }

  @override
  Future<List<Genre>> fetchMovieGenres() async {
    final response = await dio.get('/genre/movie/list');

    final List<Genre> genres = TmdbGenreListResponse.fromJson(
      response.data,
    ).genres.map((genre) => GenreMapper.tmdbToEntity(genre)).toList();

    return genres;
  }

  @override
  Future<List<Movie>> fetchTopRated({int page = 1}) {
    return _fetchMoviesFromPath('/movie/top_rated');
  }

  @override
  Future<List<Movie>> fetchUpcoming({int page = 1}) {
    return _fetchMoviesFromPath('/movie/upcoming');
  }

  @override
  Future<Movie> fetchMovieDetails(String movieId) async {
    final response = await dio.get('/movie/$movieId');
    final movie = MovieMapper.tmdbDetailToEntity(
      MovieTmdbDetail.fromJson(response.data),
    );

    return movie;
  }

  @override
  Future<List<Cast>> fetchMovieCredits(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    return TmdbCreditsResponse.fromJson(
      response.data,
    ).cast.map((e) => CastMapper.tmdbToEntity(e)).toList();
  }
}
