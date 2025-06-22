import 'package:appwrite/appwrite.dart';
import 'package:wh_mobile/src/common/constants/appwrite_constants.dart';
import 'package:wh_mobile/src/common/models/profile_model.dart';

class MerchantProfileRepository {
  final Databases _databases;

  MerchantProfileRepository(this._databases);

  /// Method to create a merchant profile in the database.
  Future<void> createProfile(ProfileModel profile) async {
    try {
      await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.profilesCollectionId,
        documentId: profile.userId,
        data: profile.toJson(),
      );
    } on AppwriteException catch (e) {
      throw Exception('Gagal membuat profil di database: ${e.message}');
    }
  }
}
