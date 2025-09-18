import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/providers/providers.dart';

part 'search_movie_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return '';
  }

  void updateQuery(String query) {
    state = query;
  }
}

@Riverpod(keepAlive: true)
class SearchedMovies extends _$SearchedMovies {
  @override
  List<Movie> build() => [];
  

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await ref.read(moviesRepositoryProvider).fetchSearchMovies(query);
    ref.read(searchQueryProvider.notifier).updateQuery(query);
    state = movies;
    
    return state;
  }
}
