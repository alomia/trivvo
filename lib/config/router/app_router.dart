import 'package:go_router/go_router.dart';
import 'package:trivvo/presentation/screens/screens.dart';
import 'package:trivvo/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          HomeScreen(child: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => HomeView(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  builder: (context, state) =>
                      MovieView(movieId: state.pathParameters['id']!),
                ),

                GoRoute(
                  path: 'all/:category',
                  builder: (context, state) => AllMoviesView(
                    category: state.pathParameters['category']!,
                  ),
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved',
              builder: (context, state) => SavedView(),
              routes: [
                GoRoute(
                  path: 'movie/:id',
                  builder: (context, state) =>
                      MovieView(movieId: state.pathParameters['id']!),
                ),
              ],
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/downloaded',
              builder: (context, state) => DownloadedView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
