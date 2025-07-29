import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivvo/presentation/providers/providers.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieScreen extends StatelessWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _MovieView(movieId));
  }
}

class _MovieView extends ConsumerWidget {
  final String movieId;

  const _MovieView(this.movieId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieState = ref.watch(movieDetailsProvider(movieId));
    final movie = movieState.value;

    final castState = ref.watch(movieCreditsProvider(movieId));
    final cast = castState.value;

    final similarMoviesState = ref.watch(recommendedMoviesProvider(movieId));
    final similarMovies = similarMoviesState.value;

    return CustomScrollView(
      slivers: [
        MovieSliverAppBar(
          isLoading: movieState.isLoading,
          backdropPath: movie?.backdropPath ?? '',
          posterPath: movie?.posterPath ?? '',
          title: movie?.title ?? 'hola',
          releaseYear: movie?.releaseDate.year ?? 0,
          genres: movie?.genres.map((genre) => genre.name).toList() ?? [],
        ),

        MovieContent(
          children: [
            MovieSynopsis(
              movie?.overview ?? '',
              isLoading: movieState.isLoading,
            ),

            const SizedBox(height: 25.0),
            MovieCast(castList: cast ?? [], isLoading: castState.isLoading),

            const SizedBox(height: 25.0),
            MoviesHorizontalList(
              title: 'Recomendaciones',
              movies: similarMovies ?? [],
              isLoading: similarMoviesState.isLoading,
            ),
          ],
        ),
      ],
    );
  }
}
