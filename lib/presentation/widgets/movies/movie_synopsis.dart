import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trivvo/domain/entities/entities.dart';

class MovieSynopsis extends StatelessWidget {
  final bool isLoading;
  final String overview;

  const MovieSynopsis(this.overview, {super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (!isLoading && overview.isEmpty) {
      return SizedBox.shrink();
    }

    return Skeletonizer(
      enabled: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.0,
            children: [
              Text(
                'Sinopsis',
                style: textTheme.titleLarge
              ),

              Text(
                isLoading ? Movie.skeleton().overview : overview,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
