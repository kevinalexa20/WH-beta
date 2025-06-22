import 'package:appwrite/appwrite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wh_mobile/src/common/constants/appwrite_constants.dart';
import 'package:wh_mobile/src/common/models/food_item_model.dart';
import 'package:wh_mobile/src/utils/appwrite_client.dart';

part 'food_repository.g.dart';

@riverpod
FoodRepository foodRepository(Ref ref) {
  final databases = ref.watch(appwriteDatabaseProvider);
  return FoodRepository(databases);
}

class FoodRepository {
  final Databases _databases;

  FoodRepository(this._databases);

  /// Mengambil semua item makanan yang tersedia.
  /// Data profil merchant sudah otomatis disertakan oleh Appwrite.
  Future<List<FoodItemModel>> getAvailableFoodItems() async {
    try {
      // Langkah 1: Ambil semua dokumen makanan yang statusnya 'available'
      final foodResponse = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.foodItemsCollectionId,
        queries: [Query.equal('status', 'available'), Query.limit(100)],
      );

      // Langkah 2: Ubah setiap dokumen menjadi objek FoodItemModel.

      final foodItems = foodResponse.documents
          .map((doc) => FoodItemModel.fromJson(doc.data))
          .toList();

      return foodItems;
    } on AppwriteException catch (e) {
      throw Exception('Gagal mengambil data makanan: ${e.message}');
    } catch (e) {
      // Tangkap error spesifik yang Anda alami sebelumnya
      if (e is TypeError) {
        throw Exception(
          'Terjadi kesalahan tipe data. Pastikan data di Appwrite cocok dengan model di aplikasi. Error: $e',
        );
      }
      throw Exception('Terjadi kesalahan tidak terduga: $e');
    }
  }

  Future<FoodItemModel> getFoodItemById(String id) async {
    try {
      final document = await _databases.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.foodItemsCollectionId,
        documentId: id,
      );
      return FoodItemModel.fromJson(document.data);
    } on AppwriteException catch (e) {
      throw Exception('Gagal mengambil detail makanan: ${e.message}');
    } catch (e) {
      throw Exception('Terjadi kesalahan tidak terduga: $e');
    }
  }
}
