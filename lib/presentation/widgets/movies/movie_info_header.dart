import 'package:flutter/material.dart';

class MovieInfoHeader extends StatelessWidget {
  final String title;
  final int releaseYear;
  final List<String> genres;

  const MovieInfoHeader({
    super.key,
    required this.title,
    required this.releaseYear,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,

      spacing: 6.0,
      children: [
        Text(
          title,
          style: textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        _MovieMetadata(releaseYear: releaseYear, genres: genres),
      ],
    );
  }
}

class _MovieMetadata extends StatelessWidget {
  final int releaseYear;
  final List<String> genres;

  const _MovieMetadata({required this.releaseYear, required this.genres});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 6.0,
      children: [
        Text(
          releaseYear.toString(),
          style: textTheme.bodyMedium!.copyWith(color: Colors.white70),
        ),

        Icon(Icons.circle, size: 5, color: Colors.white70),

        Text(
          genres.map((e) => e).take(3).join(', '),
          style: textTheme.bodyMedium!.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
