// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_lists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nowPlayingMoviesHash() => r'd93d99084e08619fe9136b5fa74cf287eabb96a3';

/// See also [NowPlayingMovies].
@ProviderFor(NowPlayingMovies)
final nowPlayingMoviesProvider =
    AutoDisposeNotifierProvider<NowPlayingMovies, List<Movie>>.internal(
      NowPlayingMovies.new,
      name: r'nowPlayingMoviesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$nowPlayingMoviesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NowPlayingMovies = AutoDisposeNotifier<List<Movie>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
