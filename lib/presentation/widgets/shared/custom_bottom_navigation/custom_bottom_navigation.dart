import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:trivvo/presentation/delegates/delegates.dart';
import 'package:trivvo/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerStatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomBottomNavigationState();
}

class _CustomBottomNavigationState
    extends ConsumerState<CustomBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      currentIndex: _selectedIndex,
      onTap: (value) {
        switch (value) {
          case 3:
            showSearch(
              context: context,
              delegate: SearchMovieDelegate(
                searchMovies: ref
                    .read(moviesRepositoryProvider)
                    .fetchSearchMovies,
              ),
            );
        }

        setState(() {
          _selectedIndex = value;
        });
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

