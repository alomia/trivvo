import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trivvo/presentation/providers/providers.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(favoriteMoviesNotifierProvider.notifier).loadFromLocalStorage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMoviesState = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMovies = nowPlayingMoviesState.value;

    final upcomingMoviesState = ref.watch(upcomingMoviesProvider);
    final upcomingMovies = upcomingMoviesState.value;

    final topRatedMoviesState = ref.watch(topRatedMoviesProvider);
    final topRatedMovies = topRatedMoviesState.value;

    return SingleChildScrollView(
      child: Column(
        children: [
          MovieCarousel(
            movies: nowPlayingMovies?.sublist(0, 6) ?? [],
            isLoading: nowPlayingMoviesState.isLoading,
          ),

          MoviesHorizontalList(
            category: 'now-playing',
            title: 'Estrenos',
            movies: nowPlayingMovies ?? [],
            isLoading: nowPlayingMoviesState.isLoading,
          ),

          const SizedBox(height: 25.0),
          MoviesHorizontalList(
            category: 'upcoming',
            title: 'próximamente',
            movies: upcomingMovies ?? [],
            isLoading: upcomingMoviesState.isLoading,
          ),

          const SizedBox(height: 25.0),
          MoviesHorizontalList(
            category: 'top-rated',
            title: 'Mejor valoradas',
            movies: topRatedMovies ?? [],
            isLoading: topRatedMoviesState.isLoading,
          ),

          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
