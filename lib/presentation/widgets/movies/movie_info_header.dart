import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

    return SizedBox(
      height: 210.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
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

          const SizedBox(height: 5.0),
          _MovieMetadata(releaseYear: releaseYear, genres: genres),

          SizedBox(height: 10.0),

          Row(
            children: [
              IconButton(
                onPressed: () => {},
                icon: Icon(PhosphorIcons.heart()),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(PhosphorIcons.downloadSimple()),
              ),

              Expanded(child: FilledButton.tonal(onPressed: () {}, child: Text('Mirar Ahora'))),
            ],
          ),
        ],
      ),
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
