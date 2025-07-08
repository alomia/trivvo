import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/models/models.dart';

class MovieMapper {
  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  static Movie tmdbToEntity(MovieTmdb movie) => Movie(
    adult: movie.adult,
    backdropPath: '$_imageBaseUrl${movie.backdropPath}',
    genreIds: movie.genreIds.map((e) => e.toString()).toList(),
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
