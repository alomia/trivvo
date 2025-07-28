import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:trivvo/presentation/widgets/widgets.dart';
import 'package:trivvo/domain/entities/entities.dart';

class MoviePosterCard extends StatelessWidget {
  final bool isSkeleton;
  final Movie movie;
  final double width;
  final double height;

  const MoviePosterCard({
    super.key,
    this.isSkeleton = false,
    required this.movie,
    this.width = 166.5,
    this.height = 250.0,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Skeletonizer(
      enabled: isSkeleton,
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            shadowColor: Colors.black87,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10.0),
              child: GestureDetector(
                onTap: () => context.push('/movie/${movie.id}'),
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        height: double.infinity,
                        imageUrl: movie.posterPath,
                        progressIndicatorBuilder: (context, url, progress) =>
                            SkeletonBox(),
                        fit: BoxFit.cover,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
