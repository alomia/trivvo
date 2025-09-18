import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movie_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return "deadpool";
  }

  void updateQuery(String query) {
    state = query;
  }
}
