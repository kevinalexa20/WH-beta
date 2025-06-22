import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wh_mobile/src/common/models/profile_model.dart';
import 'package:wh_mobile/src/features/authentication/presentation/controller/auth_controller.dart';
import 'package:wh_mobile/src/features/merchant/data/merchant_profile_repository.dart';
import 'package:wh_mobile/src/utils/appwrite_client.dart'; 

part 'merchant_profile_controller.g.dart';

// 1. Provider untuk ProfileRepository
@riverpod
MerchantProfileRepository merchantProfileRepository(Ref ref) {
  final databases = ref.watch(appwriteDatabaseProvider);
  return MerchantProfileRepository(databases);
}

// 2. State Notifier untuk mengelola proses pembuatan profil
@riverpod
class MerchantProfileController extends _$MerchantProfileController {
  @override
  FutureOr<void> build() {
    //nothing to initialize here
  }

  /// Method yang akan dipanggil oleh UI untuk memulai proses.
  Future<bool> createProfile({
    required String merchantName,
    String? description,
    required String address,
    required double latitude,
    required double longitude,
  }) async {
    state = const AsyncLoading();
    try {
      // Ambil state AuthState dari dalam AsyncValue
      final authState = ref.read(authControllerProvider).value;
      if (authState == null || authState.currentUser == null) {
        throw Exception('Tidak ada user yang login. Proses dibatalkan.');
      }
      final user = authState.currentUser!;

      // Buat objek ProfileModel dari data form
      final profile = ProfileModel(
        id: user.id,
        userId: user.id,
        merchantName: merchantName,
        description: description,
        address: address,
        latitude: latitude,
        longitude: longitude,
        profilePictureUrl: null,
      );

      // Panggil repository untuk menyimpan data
      await ref.read(merchantProfileRepositoryProvider).createProfile(profile);

     //refresh AuthController untuk memperbarui state
      ref.invalidate(authControllerProvider);

      state = const AsyncData(null);
      return true; // Mengindikasikan sukses
    } catch (e, st) {
      state = AsyncError(e, st);
      return false; // Mengindikasikan gagal
    }
  }
}
