import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/utils/appwrite_client.dart';

final splashControllerProvider =
    StateNotifierProvider<SplashController, SplashState>((ref) {
      return SplashController(ref);
    });

class SplashController extends StateNotifier<SplashState> {
  final Ref ref;

  SplashController(this.ref) : super(SplashState.loading);

  Future<void> initialize() async {
    try {
      // Simulasi loading selama 2 detik
      await Future.delayed(const Duration(seconds: 2));

      // Validasi environment variables
      AppwriteConfig.validateEnv();

      // Inisialisasi Appwrite client
      ref.read(appwriteClientProvider);

      state = SplashState.success;
    } catch (e) {
      state = SplashState.error;
    }
  }

  void navigateToHome(GoRouter router) {
    router.go('/');
  }
}

enum SplashState { loading, success, error }
