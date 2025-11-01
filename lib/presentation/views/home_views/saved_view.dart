import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:trivvo/presentation/providers/providers.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class SavedView extends ConsumerWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final favoriteMovies = ref
        .watch(favoriteMoviesNotifierProvider)
        .values
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Guardado")),
      body: favoriteMovies.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
          : SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(PhosphorIconsRegular.bookmarkSimple, size: 60.0),
                  SizedBox(height: 12.0),
                  Text(
                    'Aún no tienes películas guardadas',
                    style: textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
