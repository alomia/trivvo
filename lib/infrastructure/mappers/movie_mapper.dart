import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/models/models.dart';

class MovieMapper {
  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  static Movie tmdbListToEntity(MovieTmdbList movie) => Movie(
    adult: movie.adult,
    backdropPath: '$_imageBaseUrl${movie.backdropPath}',
    genres: movie.genreIds.map((genre) => Genre(id: genre, name: '')).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: '$_imageBaseUrl${movie.posterPath}',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );

  static Movie tmdbDetailToEntity(MovieTmdbDetail movie) => Movie(
    adult: movie.adult,
    backdropPath: '$_imageBaseUrl${movie.backdropPath}',
    genres: movie.genres
        .map((genre) => Genre(id: genre.id, name: genre.name))
        .toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: '$_imageBaseUrl${movie.posterPath}',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
