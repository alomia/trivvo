import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'favorite_movies_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoriteMoviesNotifier extends _$FavoriteMoviesNotifier {
  @override
  Map<String, Movie> build() {
    return {};
  }

  Future<void> loadFromLocalStorage() async {
    final localStorage = ref.read(localStorageRepositoryProvider);
    final movies = await localStorage.loadFavoriteMovies(limit: 50, offset: 0);

    state = {for (final m in movies) m.id: m};
  }

  /// Agrega o quita una película de favoritos
  Future<void> toggleFavorite(Movie movie) async {
    final localStorage = ref.read(localStorageRepositoryProvider);
    final isFavorite = state.containsKey(movie.id);

    await localStorage.toggleFavoriteMovie(movie);

    if (isFavorite) {
      // Remover del estado
      state = {...state}..remove(movie.id);
    } else {
      // Agregar al estado
      state = {...state, movie.id: movie};
    }
  }

  /// Verifica si una película está en favoritos
  bool isFavorite(String id) => state.containsKey(id);
}
