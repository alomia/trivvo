// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_lists_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nowPlayingMoviesHash() => r'c18bbd969d18e0f3f2672f08218cdcc27fd14057';

/// See also [nowPlayingMovies].
@ProviderFor(nowPlayingMovies)
final nowPlayingMoviesProvider = FutureProvider<List<Movie>>.internal(
  nowPlayingMovies,
  name: r'nowPlayingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nowPlayingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NowPlayingMoviesRef = FutureProviderRef<List<Movie>>;
String _$movieCarouselHash() => r'9b3ef6d747f69019be2ba4a15e197d93f0f1c36b';

/// See also [movieCarousel].
@ProviderFor(movieCarousel)
final movieCarouselProvider = FutureProvider<List<Movie>>.internal(
  movieCarousel,
  name: r'movieCarouselProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$movieCarouselHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieCarouselRef = FutureProviderRef<List<Movie>>;
String _$upcomingMoviesHash() => r'7a12a81057697fe0c73fc498b00fcdd692ffa1dc';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
final upcomingMoviesProvider = FutureProvider<List<Movie>>.internal(
  upcomingMovies,
  name: r'upcomingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpcomingMoviesRef = FutureProviderRef<List<Movie>>;
String _$topRatedMoviesHash() => r'13c84fed988d5a44d247c9522f28f1b3a9af8c3e';

/// See also [topRatedMovies].
@ProviderFor(topRatedMovies)
final topRatedMoviesProvider = FutureProvider<List<Movie>>.internal(
  topRatedMovies,
  name: r'topRatedMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topRatedMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopRatedMoviesRef = FutureProviderRef<List<Movie>>;
String _$recommendedMoviesHash() => r'752c4bf39ce99c93b043f05ddba8b86a7d1bc694';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [recommendedMovies].
@ProviderFor(recommendedMovies)
const recommendedMoviesProvider = RecommendedMoviesFamily();

/// See also [recommendedMovies].
class RecommendedMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [recommendedMovies].
  const RecommendedMoviesFamily();

  /// See also [recommendedMovies].
  RecommendedMoviesProvider call(String movieId) {
    return RecommendedMoviesProvider(movieId);
  }

  @override
  RecommendedMoviesProvider getProviderOverride(
    covariant RecommendedMoviesProvider provider,
  ) {
    return call(provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recommendedMoviesProvider';
}

/// See also [recommendedMovies].
class RecommendedMoviesProvider extends FutureProvider<List<Movie>> {
  /// See also [recommendedMovies].
  RecommendedMoviesProvider(String movieId)
    : this._internal(
        (ref) => recommendedMovies(ref as RecommendedMoviesRef, movieId),
        from: recommendedMoviesProvider,
        name: r'recommendedMoviesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$recommendedMoviesHash,
        dependencies: RecommendedMoviesFamily._dependencies,
        allTransitiveDependencies:
            RecommendedMoviesFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  RecommendedMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final String movieId;

  @override
  Override overrideWith(
    FutureOr<List<Movie>> Function(RecommendedMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecommendedMoviesProvider._internal(
        (ref) => create(ref as RecommendedMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  FutureProviderElement<List<Movie>> createElement() {
    return _RecommendedMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecommendedMoviesProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecommendedMoviesRef on FutureProviderRef<List<Movie>> {
  /// The parameter `movieId` of this provider.
  String get movieId;
}

class _RecommendedMoviesProviderElement
    extends FutureProviderElement<List<Movie>>
    with RecommendedMoviesRef {
  _RecommendedMoviesProviderElement(super.provider);

  @override
  String get movieId => (origin as RecommendedMoviesProvider).movieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
