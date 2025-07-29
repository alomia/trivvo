import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_lists_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<Movie>> nowPlayingMovies(Ref ref) {
  return ref.watch(moviesRepositoryProvider).fetchNowPlaying();
}

@Riverpod(keepAlive: true)
Future<List<Movie>> movieCarousel(Ref ref) {
  return ref.watch(moviesRepositoryProvider).fetchNowPlaying();
}

@Riverpod(keepAlive: true)
Future<List<Movie>> upcomingMovies(Ref ref) {
  return ref.watch(moviesRepositoryProvider).fetchUpcoming();
}

@Riverpod(keepAlive: true)
Future<List<Movie>> topRatedMovies(Ref ref) {
  return ref.watch(moviesRepositoryProvider).fetchTopRated();
}

@Riverpod(keepAlive: true)
Future<List<Movie>> recommendedMovies(Ref ref, String movieId) {
  return ref.watch(moviesRepositoryProvider).fetchRecommendedMovies(movieId);
}
