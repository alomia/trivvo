import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

class MovieCarouselItem extends ConsumerWidget {
  final bool isSkeleton;
  final Movie movie;

  const MovieCarouselItem(this.movie, {super.key, this.isSkeleton = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Skeletonizer(
      enabled: isSkeleton,
      child: Stack(
        children: [
          FadeIn(
            child: CachedNetworkImage(
              width: double.infinity,
              height: double.infinity,
              imageUrl: movie.backdropPath,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.3, 0.7],
                colors: [
                  colorScheme.surface,
                  colorScheme.surface.withValues(alpha: 0.0),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 32.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.0,
              children: [
                FadeIn(
                  duration: const Duration(seconds: 3),
                  delay: Duration(seconds: 1),
                  child: Text(
                    movie.title,
                    style: textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Row(
                  spacing: 5.0,
                  children: [
                    FadeIn(
                      duration: const Duration(seconds: 3),
                      delay: Duration(seconds: 2),
                      child: Text(
                        '${movie.releaseDate.year}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    FadeIn(
                      duration: const Duration(seconds: 2),
                      delay: Duration(seconds: 3),
                      child: Icon(Icons.circle, size: 5, color: Colors.white70),
                    ),

                    FadeIn(
                      duration: const Duration(seconds: 1),
                      delay: Duration(seconds: 4),
                      child: Text(
                        movie.genres
                            .map(
                              (genre) => ref
                                  .read(movieGenresProvider.notifier)
                                  .getGenreNameById(genre.id),
                            )
                            .take(4)
                            .join(', '),
                        style: textTheme.bodyMedium!.copyWith(
                          color: Colors.white70,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
