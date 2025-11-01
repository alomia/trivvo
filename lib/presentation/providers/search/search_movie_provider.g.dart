// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchQueryHash() => r'176062a6199ff630d9054a70b537dfc74fbfe627';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider = NotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = Notifier<String>;
String _$searchedMoviesHash() => r'6e0cf520ab1091a4cf678fb0a3e80fd9ca2c3c09';

/// See also [SearchedMovies].
@ProviderFor(SearchedMovies)
final searchedMoviesProvider =
    NotifierProvider<SearchedMovies, List<Movie>>.internal(
      SearchedMovies.new,
      name: r'searchedMoviesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchedMoviesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchedMovies = Notifier<List<Movie>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
