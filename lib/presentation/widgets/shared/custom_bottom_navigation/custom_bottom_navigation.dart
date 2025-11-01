import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import 'package:trivvo/domain/entities/entities.dart';
import 'package:trivvo/presentation/delegates/delegates.dart';
import 'package:trivvo/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;

    if (location.startsWith('/saved')) return 1;
    if (location.startsWith('/downloaded')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final searchedMovies = ref.read(searchedMoviesProvider);
    final searchedMoviesState = ref.read(searchedMoviesProvider.notifier);

    void onItemTapped(BuildContext context, int index) {
      switch (index) {
        case 0:
          context.go('/');
          break;

        case 1:
          context.go('/saved');
          break;

        case 2:
          context.go('/downloaded');
          break;

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
          break;
      }
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      currentIndex: getCurrentIndex(context),
      onTap: (value) => onItemTapped(context, value),

      items: [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(PhosphorIcons.house()),
          activeIcon: Icon(PhosphorIconsFill.house),
        ),
        BottomNavigationBarItem(
          label: 'Guardado',
          icon: Icon(PhosphorIcons.bookmarkSimple()),
          activeIcon: Icon(PhosphorIconsFill.bookmarkSimple),
        ),
        BottomNavigationBarItem(
          label: 'Descargado',
          icon: Icon(PhosphorIcons.downloadSimple()),
          activeIcon: Icon(PhosphorIconsFill.downloadSimple),
        ),

        BottomNavigationBarItem(
          label: 'Buscar',
          icon: Icon(PhosphorIcons.magnifyingGlass()),
          activeIcon: Icon(PhosphorIconsFill.magnifyingGlass),
        ),
      ],
    );
  }
}
