import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'genre_lists_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieGenres extends _$MovieGenres {
  @override
  Future<List<Genre>> build() async {
    return ref.watch(moviesRepositoryProvider).fetchMovieGenres();
  }

  String getGenreNameById(int id) {
    final genres = state.valueOrNull;

    if (genres == null) return 'Unknown';

    final genre = genres.firstWhere(
      (genre) => genre.id == id,
      orElse: () => Genre(id: id, name: 'Unknown'),
    );

    return genre.name;
  }
}
