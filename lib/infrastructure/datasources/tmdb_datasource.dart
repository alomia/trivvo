import 'package:dio/dio.dart';

import 'package:trivvo/config/constants/environment.dart';
import 'package:trivvo/domain/datasources/datasources.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/mappers/mappers.dart';
import 'package:trivvo/infrastructure/models/models.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {'language': 'es-mx'},
    headers: {'Authorization': 'Bearer ${Environment.tmdbAPIReadAccessToken}'},
  ),
);

class TmdbDatasource extends MoviesDatasource {
  @override
  Future<List<Movie>> fetchNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final List<Movie> movies = TmdbMovieListResponse.fromJson(
      response.data,
    ).results.map((movie) => MovieMapper.tmdbToEntity(movie)).toList();

    return movies;
  }

  @override
  Future<List<Genre>> fetchMovieGenres() async {
    final response = await dio.get('/genre/movie/list');

    final List<Genre> genres = TmdbGenreListResponse.fromJson(
      response.data,
    ).genres.map((genre) => GenreMapper.tmdbToEntity(genre)).toList();

    return genres;
  }
}
