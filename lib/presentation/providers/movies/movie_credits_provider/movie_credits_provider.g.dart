// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credits_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieCreditsHash() => r'c9eaf941c4681f63f30a5aec120fa20ac6774ca6';

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

/// See also [movieCredits].
@ProviderFor(movieCredits)
const movieCreditsProvider = MovieCreditsFamily();

/// See also [movieCredits].
class MovieCreditsFamily extends Family<AsyncValue<List<Cast>>> {
  /// See also [movieCredits].
  const MovieCreditsFamily();

  /// See also [movieCredits].
  MovieCreditsProvider call(String movieId) {
    return MovieCreditsProvider(movieId);
  }

  @override
  MovieCreditsProvider getProviderOverride(
    covariant MovieCreditsProvider provider,
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
  String? get name => r'movieCreditsProvider';
}

/// See also [movieCredits].
class MovieCreditsProvider extends FutureProvider<List<Cast>> {
  /// See also [movieCredits].
  MovieCreditsProvider(String movieId)
    : this._internal(
        (ref) => movieCredits(ref as MovieCreditsRef, movieId),
        from: movieCreditsProvider,
        name: r'movieCreditsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$movieCreditsHash,
        dependencies: MovieCreditsFamily._dependencies,
        allTransitiveDependencies:
            MovieCreditsFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  MovieCreditsProvider._internal(
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
    FutureOr<List<Cast>> Function(MovieCreditsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieCreditsProvider._internal(
        (ref) => create(ref as MovieCreditsRef),
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
  FutureProviderElement<List<Cast>> createElement() {
    return _MovieCreditsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieCreditsProvider && other.movieId == movieId;
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
mixin MovieCreditsRef on FutureProviderRef<List<Cast>> {
  /// The parameter `movieId` of this provider.
  String get movieId;
}

class _MovieCreditsProviderElement extends FutureProviderElement<List<Cast>>
    with MovieCreditsRef {
  _MovieCreditsProviderElement(super.provider);

  @override
  String get movieId => (origin as MovieCreditsProvider).movieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
