import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MoviePosterCard extends StatelessWidget {
  final Movie movie;

  const MoviePosterCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          shadowColor: Colors.black87,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10.0),
            child: SizedBox(
              width: 166.5,
              height: 250.0,
              child: Stack(
                children: [
                  CachedNetworkImage(
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
      ],
    );
  }
}
