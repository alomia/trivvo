import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_details_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieDetails extends _$MovieDetails {
  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> fetchMovieDetails(String movieId) async {
    if (state.containsKey(movieId)) return;

    final moviesRepositoty = ref.watch(moviesRepositoryProvider);
    final movie = await moviesRepositoty.fetchMovieDetails(movieId);

    state = {...state, movieId: movie};
  }
}
