// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import 'package:trivvo/domain/entities/entities.dart';
// import 'package:trivvo/presentation/providers/providers.dart';

// part 'movies_carousel.g.dart';

// @riverpod
// List<Movie> moviesCarousel(Ref ref) {
//   final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

//   if (nowPlayingMovies.movies.isEmpty) return [];

//   return nowPlayingMovies.movies.sublist(0, 6);
// }
