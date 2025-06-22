import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wh_mobile/src/common/models/food_item_model.dart';
import 'package:wh_mobile/src/features/merchant/data/food_repository.dart';
import 'package:wh_mobile/src/utils/permission_utils.dart';

part 'food_controller.g.dart';

@riverpod
class FoodController extends _$FoodController {
  @override
  Future<List<FoodItemModel>> build() async {
    // Langkah 1: Dapatkan lokasi pengguna saat ini.
    // Jika gagal (misal: izin ditolak), proses akan berhenti dan melempar error,
    // yang akan ditangani secara otomatis oleh Riverpod (menjadi AsyncError).
    final userPosition = await PermissionUtils.getCurrentLocation();

    // Langkah 2: Ambil daftar makanan yang sudah "diperkaya" dari repository.
    final allFoodItems = await ref
        .watch(foodRepositoryProvider)
        .getAvailableFoodItems();

    // Langkah 3: Hitung jarak untuk setiap item dan urutkan.
    final sortedFoodItems = List<FoodItemModel>.from(allFoodItems);

    // Menggunakan method 'sort' untuk mengurutkan list secara langsung.
    sortedFoodItems.sort((itemA, itemB) {
      // Pastikan profil tidak null sebelum menghitung jarak
      if (itemA.profile == null || itemB.profile == null) return 0;

      // Hitung jarak dari pengguna ke item A
      final distanceA = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        itemA.profile!.latitude,
        itemA.profile!.longitude,
      );

      // Hitung jarak dari pengguna ke item B
      final distanceB = Geolocator.distanceBetween(
        userPosition.latitude,
        userPosition.longitude,
        itemB.profile!.latitude,
        itemB.profile!.longitude,
      );

      // Bandingkan jarak. Ini akan mengurutkan dari yang terdekat (nilai terkecil).
      return distanceA.compareTo(distanceB);
    });

    // Langkah 4: Kembalikan daftar makanan yang sudah terurut.
    return sortedFoodItems;
  }
}

@riverpod
Future<FoodItemModel> foodDetail(Ref ref, String foodId) {
  // Panggil method baru di repository dengan ID yang diterima
  return ref.watch(foodRepositoryProvider).getFoodItemById(foodId);
}
