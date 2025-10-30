import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieSliverAppBar extends StatelessWidget {
  final bool isLoading;
  final String backdropPath;

  const MovieSliverAppBar({
    super.key,
    required this.backdropPath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      
      expandedHeight: 420.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: Skeletonizer(
        enabled: isLoading,
        child: FlexibleSpaceBar(
          collapseMode: CollapseMode.none,
          background: MovieBackdrop(backdropPath),
        ),
      ),
    );
  }
}
