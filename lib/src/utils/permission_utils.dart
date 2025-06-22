import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// Helper method untuk menangani seluruh alur perizinan dan pengambilan lokasi.
  static Future<Position> getCurrentLocation() async {
    // 1. Cek status izin lokasi
    var status = await Permission.location.status;

    // 2. Jika izin belum diberikan, minta izin
    if (status.isDenied) {
      status = await Permission.location.request();
    }

    // 3. Handle berbagai kemungkinan status setelah diminta
    if (status.isGranted) {
      // Jika diizinkan, coba dapatkan lokasi
      try {
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
      } catch (e) {
        // Handle jika ada error saat mengambil lokasi (misal: GPS mati)
        throw Exception(
          'Gagal mendapatkan data GPS. Pastikan layanan lokasi Anda aktif.',
        );
      }
    } else if (status.isPermanentlyDenied) {
      // Jika ditolak permanen, beri pesan untuk membuka pengaturan
      throw Exception(
        'Izin lokasi ditolak permanen. Silakan aktifkan secara manual di pengaturan aplikasi.',
      );
    } else {
      // Jika ditolak sementara
      throw Exception('Izin lokasi diperlukan untuk menentukan lokasi warung.');
    }
  }
}
