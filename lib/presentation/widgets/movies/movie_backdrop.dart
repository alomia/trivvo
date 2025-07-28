import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class MovieBackdrop extends StatelessWidget {
  final String path;

  const MovieBackdrop(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 400.0,
      child: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: path,
            fit: BoxFit.cover,

            // progressIndicatorBuilder: (context, url, progress) => SkeletonBox(),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.0, 0.5, 0.7],
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
    );
  }
}
