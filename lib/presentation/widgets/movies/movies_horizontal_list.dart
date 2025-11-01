import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/domain/entities/entities.dart';

import 'package:trivvo/presentation/widgets/movies/movie_poster.dart';

class MoviesHorizontalList extends StatelessWidget {
  final String category;
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
    required this.category,
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: textTheme.titleLarge),
                TextButton(
                  onPressed: () => context.push('/all/$category'),
                  child: Text('Ver todos'),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 250.0,
            child: ListView.builder(
              itemCount: isLoading ? 5 : movies.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 5.0),

              itemBuilder: (context, index) {
                final movie = isLoading ? Movie.skeleton() : movies[index];

                return MoviePoster(
                  isLoading: isLoading,
                  imageUrl: movie.posterPath,
                  navigationRoute: '/movie/${movie.id}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
