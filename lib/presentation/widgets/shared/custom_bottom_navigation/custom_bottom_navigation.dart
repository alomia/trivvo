import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/delegates/delegates.dart';
import 'package:trivvo/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final searchedMovies = ref.read(searchedMoviesProvider);
    final searchedMoviesState = ref.read(searchedMoviesProvider.notifier);

    int _selectedIndex = 0;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      currentIndex: _selectedIndex,
      onTap: (value) {
        switch (value) {
          case 3:
            showSearch<Movie?>(
              query: searchQuery,
              context: context,
              delegate: SearchMovieDelegate(
                initialMovies: searchedMovies,
                searchMovies: searchedMoviesState.searchMoviesByQuery,
              ),
            ).then((movie) {
              if (movie == null) return;
              context.push('/movie/${movie.id}');
            });
        }
      },

      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(PhosphorIcons.house()),
          activeIcon: Icon(PhosphorIconsFill.house),
        ),
        BottomNavigationBarItem(
          label: 'Saved',
          icon: Icon(PhosphorIcons.bookmarkSimple()),
          activeIcon: Icon(PhosphorIconsFill.bookmarkSimple),
        ),
        BottomNavigationBarItem(
          label: 'Downloaded',
          icon: Icon(PhosphorIcons.downloadSimple()),
          activeIcon: Icon(PhosphorIconsFill.downloadSimple),
        ),

        BottomNavigationBarItem(
          label: 'Search',
          icon: Icon(PhosphorIcons.magnifyingGlass()),
          activeIcon: Icon(PhosphorIconsFill.magnifyingGlass),
        ),
      ],
    );
  }
}
