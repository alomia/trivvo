import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieCarousel extends StatelessWidget {
  final bool isLoading;
  final List<Movie> movies;

  const MovieCarousel({
    super.key,
    this.isLoading = false,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        width: double.infinity,
        height: 600,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 0.8,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 60),
            viewportFraction: 1.0,
          ),
          itemCount: isLoading ? 1 : movies.length,
          itemBuilder: (context, index, realIndex) {
            final movie = isLoading ? Movie.skeleton() : movies[index];

            return MovieCarouselItem(isSkeleton: isLoading, movie);
          },
        ),
      ),
    );
  }
}
