import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/models/models.dart';

class MovieMapper {
  static const _posterBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const _backdropBaseUrl = 'https://image.tmdb.org/t/p/w1280';
  static const _fallbackImage =
      'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png';

  static Movie tmdbListToEntity(MovieTmdbList movie) => Movie(
    adult: movie.adult,
    backdropPath: '$_backdropBaseUrl${movie.backdropPath}',
    genres: movie.genreIds.map((genre) => Genre(id: genre, name: '')).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: movie.posterPath == null
        ? _fallbackImage
        : "$_posterBaseUrl${movie.posterPath}",
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );

  static Movie tmdbDetailToEntity(MovieTmdbDetail movie) => Movie(
    adult: movie.adult,
    backdropPath: movie.backdropPath == null
        ? ''
        : '$_backdropBaseUrl${movie.backdropPath}',
    genres: movie.genres
        .map((genre) => Genre(id: genre.id, name: genre.name))
        .toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview ?? '',
    popularity: movie.popularity,
    posterPath: '$_posterBaseUrl${movie.posterPath}',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
