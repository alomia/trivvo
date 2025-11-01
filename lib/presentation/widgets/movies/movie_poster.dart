import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviePoster extends StatelessWidget {
  final String imageUrl;
  final String navigationRoute;
  final bool isLoading;
  final double? width;
  final double? height;

  const MoviePoster({
    super.key,
    this.isLoading = false,
    this.width = 166.5,
    this.height = 250.0,
    required this.navigationRoute,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Skeletonizer(
      enabled: isLoading,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        shadowColor: Colors.black87,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10.0),
          child: GestureDetector(
            onTap: () => context.push(navigationRoute),
            child: Stack(
              children: [
                CachedNetworkImage(
                  width: width,
                  height: height,
                  imageUrl: imageUrl,
                  cacheKey: imageUrl,

                  fit: BoxFit.cover,
                ),
                Container(
                  width: width,
                  height: height,
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
    );
  }
}
