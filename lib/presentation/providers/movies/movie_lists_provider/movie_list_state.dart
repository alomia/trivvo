import 'package:trivvo/domain/entities/entities.dart';

class MovieListState {
  final bool isLoading;
  final List<Movie> movies;

  MovieListState({required this.isLoading, required this.movies});

  MovieListState copyWith({bool? isLoading, List<Movie>? movies}) =>
      MovieListState(
        isLoading: isLoading ?? this.isLoading,
        movies: movies ?? this.movies,
      );
}
