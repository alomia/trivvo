import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
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

    final colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(
      slivers: [
        MovieSliverAppBar(
          isLoading: movieState.isLoading,
          backdropPath: movie?.backdropPath ?? '',
        ),

        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Skeletonizer(
                    enabled: movieState.isLoading,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MoviePoster(movie?.posterPath ?? ''),
                        SizedBox(width: 16.0),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.59,
                          child: MovieInfoHeader(
                            title: movie?.title ?? '',
                            releaseYear: movie?.releaseDate.year ?? 0,
                            genres: movie?.genres.map((e) => e.name).toList() ?? [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            
                const SizedBox(height: 25.0),
                MovieSynopsis(
                  movie?.overview ?? '',
                  isLoading: movieState.isLoading,
                ),
            
                const SizedBox(height: 25.0),
                MovieCast(castList: cast ?? [], isLoading: castState.isLoading),
            
                MoviesHorizontalList(
                  title: 'Recomendaciones',
                  movies: similarMovies ?? [],
                  isLoading: similarMoviesState.isLoading,
                ),

                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

