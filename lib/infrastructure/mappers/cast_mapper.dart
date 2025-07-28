import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/infrastructure/models/models.dart';

abstract class CastMapper {
  static const _imageBaseUrl = 'https://image.tmdb.org/t/p/original';

  static Cast tmdbToEntity(CastTmdb cast) => Cast(
    name: cast.name,
    character: cast.character!,
    profilePath: cast.profilePath != null
        ? '$_imageBaseUrl${cast.profilePath}'
        : null,
  );
}
