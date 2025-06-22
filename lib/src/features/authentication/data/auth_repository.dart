import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:wh_mobile/src/common/common.dart';
import 'package:wh_mobile/src/common/constants/appwrite_constants.dart';
import 'package:wh_mobile/src/features/authentication/domain/auth_request_model.dart';

class AuthRepository {
  final Account _account;
  final Databases _databases;
  // final Users _users;

  // Constructor to initialize the Account and Databases instances
  AuthRepository(this._account, this._databases);

  //method to handle registration
  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      //model for appwrite user
      final User appwriteUser = await _account.create(
        userId: ID.unique(),
        email: request.email,
        password: request.password,
        name: request.name,
      );

      final Session session = await _account.createEmailPasswordSession(
        email: request.email,
        password: request.password,
      );

      // Create a new user document in the database
      final UserModel userForDb = UserModel(
        id: appwriteUser.$id,
        name: request.name,
        email: request.email,
        role: request.role,
        phoneNumber: request.phoneNumber,
      );

      // Save the user document to the database
      await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollectionId,
        documentId: appwriteUser.$id,
        data: userForDb.toJson(),
      );

      // Return the AuthResponse with user details
      return AuthResponse(
        userId: appwriteUser.$id,
        sessionId: session.$id,
        user: userForDb,
      );
    } on AppwriteException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred during registration: $e');
    }
  }

  // Buat method baru untuk mengambil profil berdasarkan userId
  Future<ProfileModel?> getProfile(String userId) async {
    try {
      final document = await _databases.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.profilesCollectionId,
        documentId: userId,
      );
      return ProfileModel.fromJson(document.data);
    } on AppwriteException catch (e) {
      if (e.code == 404) {
        return null;
      }
      rethrow;
    }
  }

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      // Create session
      final Session session = await _account.createEmailPasswordSession(
        email: request.email,
        password: request.password,
      );

      // Get user data from database
      final document = await _databases.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollectionId,
        documentId: session.userId,
      );

      final UserModel user = UserModel.fromJson(document.data);

      return AuthResponse(
        userId: session.userId,
        sessionId: session.$id,
        user: user,
      );
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e) {
      throw Exception('Logout failed: $e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final User appwriteUser = await _account.get();

      final document = await _databases.getDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollectionId,
        documentId: appwriteUser.$id,
      );

      return UserModel.fromJson(document.data);
    } catch (e) {
      return null; // User not logged in
    }
  }

  //method get current profile
  Future<ProfileModel?> getCurrentProfile() async {
    try {
      final user = await getCurrentUser();
      if (user == null) return null;

      return await getProfile(user.id);
    } catch (e) {
      throw Exception('Failed to get current profile: $e');
    }
  }
}
