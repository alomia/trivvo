import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/movies/movie_lists_provider/movie_list_state.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'movie_lists_provider.g.dart';


@riverpod
class NowPlayingMovies extends _$NowPlayingMovies {
  @override
  MovieListState build() {
    return MovieListState(isLoading: false, movies: []);
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

@riverpod
class TopRatedMovies extends _$TopRatedMovies {
  @override
  MovieListState build() {
    return MovieListState(isLoading: false, movies: []);
  }

  Future<void> loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final moviesRepository = ref.watch(moviesRepositoryProvider);
    final List<Movie> movies = await moviesRepository.fetchTopRated();

    state = state.copyWith(
      isLoading: false,
      movies: [...state.movies, ...movies],
    );
  }
}

@riverpod
class UpcomingMovies extends _$UpcomingMovies {
  @override
  MovieListState build() {
    return MovieListState(isLoading: false, movies: []);
  }

  Future<void> loadNextPage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final moviesRepository = ref.watch(moviesRepositoryProvider);
    final List<Movie> movies = await moviesRepository.fetchUpcoming();

    state = state.copyWith(
      isLoading: false,
      movies: [...state.movies, ...movies],
    );
  }
}
