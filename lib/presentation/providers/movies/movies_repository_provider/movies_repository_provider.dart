import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:trivvo/infrastructure/datasources/datasources.dart';
import 'package:trivvo/infrastructure/repositories/repositories.dart';

part 'movies_repository_provider.g.dart';

@riverpod
MovieRepositoryImpl moviesRepository(Ref ref) {
  return MovieRepositoryImpl(TmdbDatasource());
}
