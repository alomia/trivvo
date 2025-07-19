class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.skeleton() {
    return Movie(
      id: 0,
      title: 'Skeleton title',
      overview: 'Skeleton overview',
      posterPath:
          'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      backdropPath:
          'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
      releaseDate: DateTime(2023, 01, 01),
      voteAverage: 0.0,
      genreIds: [1, 2],
      originalLanguage: 'en',
      originalTitle: 'Skeleton original title',
      popularity: 0.0,
      video: false,
      voteCount: 0,
      adult: false,
    );
  }
}
