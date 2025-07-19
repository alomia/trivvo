import 'package:flutter/material.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieCarouselSkeleton extends StatelessWidget {
  const MovieCarouselSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonBox(width: double.infinity, height: 600.0);
  }
}
