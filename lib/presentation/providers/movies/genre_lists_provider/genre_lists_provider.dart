import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'genre_lists_provider.g.dart';

@riverpod
class MovieGenres extends _$MovieGenres {
  @override
  List<Genre> build() {
    return [];
  }

  Future<void> fetchMovieGenres() async {
    final moviesRepository = ref.watch(moviesRepositoryProvider);
    final List<Genre> genres = await moviesRepository.fetchMovieGenres();

    state = [...state, ...genres];
  }

  String getGenreNameById(int genreId) {
    final genre = state.firstWhere(
      (genre) => genre.id == genreId,
      orElse: () => Genre(id: -1, name: ''),
    );

    return genre.name;
  }
}
