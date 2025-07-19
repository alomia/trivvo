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

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
      ref.read(movieGenresProvider.notifier).fetchMovieGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(movieGenresProvider);
    final nowPlayingState = ref.watch(nowPlayingMoviesProvider);
    final moviesCarousel = ref.watch(moviesCarouselProvider);

    return Column(
      spacing: 10.0,
      children: [
        MovieCarousel(
          movies: moviesCarousel,
          isSkeleton: nowPlayingState.isLoading,
        ),

        MoviesHorizontalList(
          title: 'En cines',
          movies: nowPlayingState.movies,
          isSkeleton: nowPlayingState.isLoading,
        ),
      ],
    );
  }
}
