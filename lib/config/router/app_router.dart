import 'package:go_router/go_router.dart';
import 'package:trivvo/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) =>
              MovieScreen(movieId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: 'all/:category',
          name: AllMoviesScreen.name,
          builder: (context, state) =>
              AllMoviesScreen(category: state.pathParameters['category']!),
        ),
      ],
    ),
  ],
);
