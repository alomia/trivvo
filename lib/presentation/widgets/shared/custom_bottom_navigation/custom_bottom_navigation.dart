import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      currentIndex: selectedIndex,
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
