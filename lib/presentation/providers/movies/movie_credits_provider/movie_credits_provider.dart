import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_credits_provider.g.dart';

// @Riverpod(keepAlive: true)
// class MovieCredits extends _$MovieCredits {
//   @override
//   Map<String, List<Cast>> build() {
//     return {};
//   }

//   Future<void> fetchMovieCredits(String movieId) async {
//     if (state.containsKey(movieId)) return;

//     final credits = await ref.read(moviesRepositoryProvider).fetchMovieCredits(movieId);
//     state = {...state, movieId: credits};
//   }
// }

@Riverpod(keepAlive: true)
Future<List<Cast>> movieCredits(Ref ref, String movieId) {
  return ref.watch(moviesRepositoryProvider).fetchMovieCredits(movieId);
}
