import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wh_mobile/src/utils/permission_utils.dart';

part 'location_controller.g.dart';

/// Provider ini akan mendapatkan lokasi realtime pengguna,
/// lalu mengubahnya menjadi nama lokasi yang bisa dibaca.
@riverpod
Future<Placemark> userLocationName(Ref ref) async {
  // 1. Dapatkan posisi GPS
  final position = await PermissionUtils.getCurrentLocation();

  // 2. Ubah koordinat menjadi daftar alamat/nama lokasi
  final placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  // 3. Kembalikan hasil pertama yang paling relevan
  if (placemarks.isNotEmpty) {
    return placemarks.first;
  } else {
    throw Exception('Tidak dapat menemukan nama lokasi.');
  }
}
