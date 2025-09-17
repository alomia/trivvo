import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:trivvo/config/helpers/helpers.dart';

import 'package:trivvo/domain/entities/entities.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String? get searchFieldLabel => "Search Movies";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(
          onPressed: () {
            query.isEmpty ? null : query = "";
          },
          icon: Icon(PhosphorIconsRegular.x),
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(PhosphorIconsRegular.caretLeft),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.builder(
            itemCount: query.isNotEmpty ? movies.length + 1 : movies.length,
            itemBuilder: (context, index) {
              if (index == 0 && query.isNotEmpty)  {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Text("Search results for: ", style: textTheme.titleLarge),
                      Expanded(
                        child: Text(
                          query,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleLarge!.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              final movie = movies[index - 1];

              return Padding(
                padding: const EdgeInsets.only(bottom: 7.0),
                child: _MovieItem(movie: movie),
              );
            },
          ),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: SizedBox(
              width: 130.0,
              height: 200.0,
              child: Image.network(movie.posterPath, fit: BoxFit.cover),
            ),
          ),

          Expanded(
            child: SizedBox(
              height: 190.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textTheme.titleMedium),
                    SizedBox(height: 10.0),

                    Row(
                      children: [
                        Text(
                          "${movie.releaseDate.year.toString()}  |  ${HumanFormats.number(movie.voteAverage, 1)}",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),

                        SizedBox(width: 10.0),

                        SizedBox(
                          width: 25.0,
                          child: Image.asset("assets/images/tmdb.png"),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
