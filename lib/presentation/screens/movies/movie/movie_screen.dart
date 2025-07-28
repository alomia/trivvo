import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivvo/domain/entities/movie.dart';
import 'package:trivvo/presentation/providers/providers.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  ConsumerState<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(movieDetailsProvider.notifier).fetchMovieDetails(widget.movieId);
    ref.read(movieCreditsProvider.notifier).fetchMovieCredits(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(movieDetailsProvider)[widget.movieId];

    return Scaffold(
      body: _MovieView(movie ?? Movie.skeleton(), isLoading: movie == null),
    );
  }
}

class _MovieView extends ConsumerWidget {
  final bool isLoading;
  final Movie movie;

  const _MovieView(this.movie, {this.isLoading = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cast = ref.watch(movieCreditsProvider)[movie.id];

    return CustomScrollView(
      slivers: [
        MovieSliverAppBar(
          isLoading: isLoading,
          backdropPath: movie.backdropPath,
          posterPath: movie.posterPath,
          title: movie.title,
          releaseYear: movie.releaseDate.year,
          genres: movie.genres.map((genre) => genre.name).toList(),
        ),

        MovieContent(
          children: [
            MovieSynopsis(movie.overview, isLoading: isLoading),

            MovieCast(castList: cast ?? [], isLoading: cast == null),
          ],
        ),
      ],
    );
  }
}
