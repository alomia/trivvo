// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_lists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieGenresHash() => r'bb5d84eca0870ba5b7f5d89cd224e79c4a69a2bd';

/// See also [MovieGenres].
@ProviderFor(MovieGenres)
final movieGenresProvider =
    AsyncNotifierProvider<MovieGenres, List<Genre>>.internal(
      MovieGenres.new,
      name: r'movieGenresProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$movieGenresHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MovieGenres = AsyncNotifier<List<Genre>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
