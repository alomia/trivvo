class Cast {
  final String name;
  final String character;
  final String? profilePath;

  Cast({
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory Cast.skeleton() {
    return Cast(
      name: 'Skeleton Name',
      character: 'Skeleton Character',
      profilePath: 'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
    );
  }
}
