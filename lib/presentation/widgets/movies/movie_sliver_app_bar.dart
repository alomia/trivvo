import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class MovieSliverAppBar extends StatelessWidget {
  final bool isLoading;
  final String backdropPath;
  final String posterPath;
  final String title;
  final int releaseYear;
  final List<String> genres;

  const MovieSliverAppBar({
    super.key,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.releaseYear,
    required this.genres,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 420.0,
      flexibleSpace: Skeletonizer(
        enabled: isLoading,
        child: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Stack(
            children: [
              MovieBackdrop(backdropPath),
            
              Positioned(
                top: 320.0 - (210.0 / 2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MoviePoster(posterPath),
                      SizedBox(width: 16.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: MovieInfoHeader(
                          title: title,
                          releaseYear: releaseYear,
                          genres: genres,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
