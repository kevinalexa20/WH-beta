import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wh_mobile/src/features/authentication/data/auth_repository.dart';
import 'package:wh_mobile/src/features/authentication/domain/auth_request_model.dart';
import 'package:wh_mobile/src/utils/appwrite_client.dart';

part 'auth_controller.g.dart';

// Provier for AuthRepository
@riverpod
AuthRepository authRepository(Ref ref) {
  final account = ref.watch(appwriteAccountProvider);
  final databases = ref.watch(appwriteDatabaseProvider);
  return AuthRepository(account, databases);
}
@riverpod
class AuthController extends _$AuthController {
  // initiate state awal
  @override
  Future<AuthState> build() async {
    final authRepo = ref.watch(authRepositoryProvider);
    final user = await authRepo.getCurrentUser();

    if (user != null) {
      final profile = await authRepo.getProfile(user.id);
      return AuthState(
        isAuthenticated: true,
        currentUser: user,
        currentProfile: profile,
      );
    } else {
      // Kembalikan state default jika tidak ada user
      return const AuthState();
    }
  }

  /// Method login
  Future<void> login(LoginRequest request) async {
    // Atur state ke loading
    state = const AsyncLoading();
    // Jalankan proses dan perbarui state dengan hasilnya
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).login(request);
      // Panggil build() lagi untuk mendapatkan state terbaru setelah login
      return build();
    });
  }

  /// Method untuk register
  Future<void> register(RegisterRequest request) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).register(request);
      // Panggil build() lagi untuk mendapatkan state terbaru setelah register
      return build();
    });
  }

  /// Method untuk logout
  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(authRepositoryProvider).logout();
      // Kembalikan ke state awal setelah logout
      return const AuthState();
    });
  }
}
