import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:trivvo/domain/entities/entities.dart';

import 'package:trivvo/presentation/widgets/movies/movies_horizontal_list/movie_poster_card.dart';

class MoviesHorizontalList extends StatelessWidget {
  final VoidCallback? loadNextPage;
  final String title;
  final List<Movie> movies;

  const MoviesHorizontalList({
    super.key,
    this.loadNextPage,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 350.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FadeIn(
              child: Row(
                children: [
                  Text(title, style: textTheme.titleLarge),

                  Spacer(),

                  TextButton(onPressed: () {}, child: Text('Ver todos')),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 300.0,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10.0),

              itemBuilder: (context, index) =>
                  FadeIn(child: MoviePosterCard(movie: movies[index])),
            ),
          ),
        ],
      ),
    );
  }
}
