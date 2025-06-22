import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/common/common.dart';
import 'package:wh_mobile/src/features/authentication/authentication.dart';
import 'package:wh_mobile/src/features/home/presentation/widgets/navbar_screen.dart';
import 'package:wh_mobile/src/features/merchant/presentation/view/create_profile_screen.dart';
import 'package:wh_mobile/src/features/merchant/presentation/view/food_detail_screen.dart';
import 'package:wh_mobile/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:wh_mobile/src/features/startup/presentation/view/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // 1. Awasi perubahan state. Ini akan membuat ulang router saat state berubah.
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/splash',

    // 2. refreshListenable DIHAPUS karena router sudah reaktif berkat ref.watch.
    redirect: (context, state) {
      // 3. Logika redirect tetap sama, menggunakan authState yang sudah di-watch.
      return authState.when(
        loading: () =>
            '/splash', // Selama loading, selalu tampilkan splash screen.
        error: (err, stack) => '/login', // Jika ada error, arahkan ke login.
        data: (data) {
          final isLoggedIn = data.isAuthenticated;
          final user = data.currentUser;
          final profile = data.currentProfile;

          final publicRoutes = [
            '/splash',
            '/onboarding',
            '/register',
            '/login',
          ];
          final isGoingToPublicRoute = publicRoutes.contains(
            state.matchedLocation,
          );

          // Jika belum login dan mencoba akses halaman privat
          if (!isLoggedIn && !isGoingToPublicRoute) {
            return '/login';
          }

          if (!isLoggedIn && state.matchedLocation == '/splash') {
            return '/login';
          }

          // Jika sudah login
          if (isLoggedIn) {
            // Guard untuk merchant yang belum punya profil
            if (user?.role == UserRole.merchant &&
                profile == null &&
                state.matchedLocation != '/create-profile') {
              return '/create-profile';
            }

            // Jika sudah login dan mencoba akses halaman publik (misal: setelah dari create-profile)
            if (isGoingToPublicRoute) {
              return '/onboarding';
            }
          }

          // Jika semua kondisi di atas tidak terpenuhi, tidak perlu redirect.
          return null;
        },
      );
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => NavbarScreen()),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
      GoRoute(
        path: '/create-profile',
        builder: (context, state) => const CreateProfileScreen(),
      ),
      GoRoute(
        path:
            '/food-detail/:foodItemId', // ':foodItemId' adalah parameter dinamis
        builder: (context, state) {
          // Ambil ID dari parameter URL
          final foodItemId = state.pathParameters['foodItemId']!;
          return FoodDetailScreen(foodItemId: foodItemId);
        },
      ),
    ],
  );
});
