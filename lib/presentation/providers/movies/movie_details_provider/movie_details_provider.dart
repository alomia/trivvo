import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_details_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Movie> movieDetails (Ref ref, String movieId) async {
  return await ref.watch(moviesRepositoryProvider).fetchMovieDetails(movieId);
}
