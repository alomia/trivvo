import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_lists_provider.g.dart';

class NowPlayingMoviesState {
  final bool isLoading;
  final List<Movie> movies;

  NowPlayingMoviesState({required this.isLoading, required this.movies});

  NowPlayingMoviesState copyWith({bool? isLoading, List<Movie>? movies}) =>
      NowPlayingMoviesState(
        isLoading: isLoading ?? this.isLoading,
        movies: movies ?? this.movies,
      );
}

@riverpod
class NowPlayingMovies extends _$NowPlayingMovies {
  @override
  NowPlayingMoviesState build() {
    return NowPlayingMoviesState(isLoading: false, movies: []);
  }

  Future<void> loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final moviesRepository = ref.watch(moviesRepositoryProvider);
    final List<Movie> movies = await moviesRepository.fetchNowPlaying();

    state = state.copyWith(
      isLoading: false,
      movies: [...state.movies, ...movies],
    );
  }
}
