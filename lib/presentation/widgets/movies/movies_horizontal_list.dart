import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/domain/entities/entities.dart';

import 'package:trivvo/presentation/widgets/movies/movie_poster_card.dart';

class MoviesHorizontalList extends StatelessWidget {
  final VoidCallback? loadNextPage;
  final bool isLoading;
  final String title;
  final List<Movie> movies;

  const MoviesHorizontalList({
    super.key,
    this.loadNextPage,
    this.isLoading = false,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: textTheme.titleLarge),
                TextButton(onPressed: () {}, child: Text('Ver todos')),
              ],
            ),
          ),
      
          SizedBox(
            height: 250.0,
            child: ListView.builder(
              itemCount: isLoading ? 5 : movies.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
      
              itemBuilder: (context, index) {
                final movie = isLoading ? Movie.skeleton() : movies[index];
      
                return MoviePosterCard(isLoading: isLoading, movie: movie);
              },
            ),
          ),
        ],
      ),
    );
  }
}
