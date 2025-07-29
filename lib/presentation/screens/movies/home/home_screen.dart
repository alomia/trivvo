import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trivvo/presentation/providers/providers.dart';
import 'package:trivvo/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

          const SizedBox(height: 25.0),
          MoviesHorizontalList(
            title: 'En cines',
            movies: nowPlayingMovies ?? [],
            isLoading: nowPlayingMoviesState.isLoading,
          ),

          const SizedBox(height: 25.0),
          MoviesHorizontalList(
            title: 'próximamente',
            movies: upcomingMovies ?? [],
            isLoading: upcomingMoviesState.isLoading,
          ),

          const SizedBox(height: 25.0),
          MoviesHorizontalList(
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
