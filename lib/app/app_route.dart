part of 'app.dart';

final _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: SplashScreen.routeName,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: "/home",
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
