import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieCarousel extends StatelessWidget {
  final List<Movie> movies;

  const MovieCarousel({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 0.8,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 60),
        viewportFraction: 1.0,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) =>
          MovieCarouselItem(movies[index]),
    );
  }
}
