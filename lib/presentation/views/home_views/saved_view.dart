import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:trivvo/presentation/providers/providers.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class SavedView extends ConsumerWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMovies = ref
        .watch(favoriteMoviesNotifierProvider)
        .values
        .toList();

    return Scaffold(
      body: favoriteMovies.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0,  top: 10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.666,
                ),
                itemCount: favoriteMovies.length,
                itemBuilder: (context, index) {
                  final movie = favoriteMovies[index];
                  return MoviePoster(
                    imageUrl: movie.posterPath,
                    navigationRoute: '/saved/movie/${movie.id}',
                  );
                },
              ),
            )
          : EmptyState(
              icon: PhosphorIconsRegular.bookmarkSimple,
              message: 'Aún no tienes películas guardadas',
            ),
    );
  }
}
