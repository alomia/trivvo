import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieSynopsis extends StatelessWidget {
  final bool isLoading;
  final String overview;

  const MovieSynopsis(this.overview, {super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return overview.isNotEmpty
        ? Skeletonizer(
            enabled: isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text(
                    'Sinopsis',
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),

                  Text(overview, style: textTheme.bodyMedium),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
