import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivvo/presentation/providers/providers.dart';

import 'package:trivvo/presentation/widgets/widgets.dart';

class AllMoviesView extends ConsumerWidget {
  static const name = 'all-movies-view';

  final String category;

  const AllMoviesView({super.key, required this.category});

  static const Map<String, String> _titles = {
    'now-playing': 'Estrenos',
    'upcoming': 'Próximamente',
    'top-rated': 'Mejor valoradas',
    'popular': 'Populares',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = _titles[category] ?? 'Peliculas';

    final nowPlayingMoviesState = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMovies = nowPlayingMoviesState.value;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.666,
          ),
          itemCount: nowPlayingMovies?.length,
          itemBuilder: (context, index) {
            final movie = nowPlayingMovies![index];
            return MoviePoster(
              imageUrl: movie.posterPath,
              navigationRoute: '/movie/${movie.id}',
            );
          },
        ),
      ),
    );
  }
}
