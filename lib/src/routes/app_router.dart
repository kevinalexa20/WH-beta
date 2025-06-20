import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/features/authentication/presentation/view/login_screen.dart';
import 'package:wh_mobile/src/features/startup/presentation/view/splash_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(title: "test"),
    ),
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
  ],
);
