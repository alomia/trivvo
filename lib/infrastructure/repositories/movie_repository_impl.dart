import 'package:trivvo/domain/datasources/datasources.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/domain/repositories/repositories.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
