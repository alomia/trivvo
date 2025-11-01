import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

class MovieInfoHeader extends ConsumerWidget {
  final Movie movie;

  const MovieInfoHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final favoriteMovies = ref.watch(favoriteMoviesNotifierProvider);
    final notifier = ref.read(favoriteMoviesNotifierProvider.notifier);

    final isFavorite = favoriteMovies.containsKey(movie.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          movie.title,
          style: textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
    
        const SizedBox(height: 5.0),
        _MovieMetadata(
          releaseYear: movie.releaseDate.year,
          genres: movie.genres.map((e) => e.name).toList(),
        ),
    
        SizedBox(height: 25.0),
    
        Row(
          children: [
            IconButton.filledTonal(
              onPressed: () async {
                await notifier.toggleFavorite(movie);
              },
              style: IconButton.styleFrom(
                backgroundColor: isFavorite
                    ? Colors.redAccent.withValues(alpha: 0.2)
                    : Colors.grey.withValues(alpha: 0.2),
              ),
              icon: isFavorite
                  ? Icon(PhosphorIconsFill.heart, color: Colors.redAccent)
                  : Icon(PhosphorIconsRegular.heart),
            ),
    
            IconButton.filledTonal(
              onPressed: () => {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.grey.withValues(alpha: 0.2),
              ),
              icon: Icon(PhosphorIconsRegular.downloadSimple),
            ),
    
            SizedBox(width: 4.0),
    
            Expanded(
              child: FilledButton.icon(
                onPressed: () {},
                icon: Icon(PhosphorIconsFill.play),
                label: Text('Mirar Ahora'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MovieMetadata extends StatelessWidget {
  final int releaseYear;
  final List<String> genres;

  const _MovieMetadata({required this.releaseYear, required this.genres});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 6.0,
      children: [
        Text(
          releaseYear.toString(),
          style: textTheme.bodyMedium!.copyWith(color: Colors.white70),
        ),

        Icon(Icons.circle, size: 5, color: Colors.white70),

        Text(
          genres.map((e) => e).take(3).join(', '),
          style: textTheme.bodyMedium!.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
