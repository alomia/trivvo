import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_lists_provider.g.dart';

@riverpod
class NowPlayingMovies extends _$NowPlayingMovies {
  @override
  List<Movie> build() {
    return [];
  }

  Future<void> loadNextPage() async {
    final moviesRepository = ref.watch(moviesRepositoryProvider);
    final List<Movie> movies = await moviesRepository.getNowPlaying();

    state = [...state, ...movies];
  }
}
