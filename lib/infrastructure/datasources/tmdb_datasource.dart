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
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final tmdbResponse = TmdbResponse.fromJson(response.data);

    final List<Movie> movies = tmdbResponse.results
        .map((movie) => MovieMapper.tmdbToEntity(movie))
        .toList();

    return movies;
  }
}
