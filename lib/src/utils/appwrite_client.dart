import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wh_mobile/src/features/authentication/authentication.dart';

part 'appwrite_client.g.dart';

//to check if the environment variables are set correctly
class AppwriteConfig {
  static void validateEnv() {
    final requiredVars = [
      'APPWRITE_API_ENDPOINT',
      'APPWRITE_PROJECT_ID',
      'APPWRITE_DATABASE_ID',
      'PROFILES_COLLECTION_ID',
      'USERS_COLLECTION_ID',
      'FOOD_ITEMS_COLLECTION_ID',
      // 'APPWRITE_STORAGE_BUCKET_ID',
    ];

    // Check if all required environment variables are set
    final missingVars = requiredVars
        .where(
          (envVar) => dotenv.env[envVar] == null || dotenv.env[envVar]!.isEmpty,
        )
        .toList();
    if (missingVars.isNotEmpty) {
      throw Exception(
        'Missing environment variables: ${missingVars.join(', ')}',
      );
    }
  }
}

// Client instance
@riverpod
Client appwriteClient(Ref ref) {
  AppwriteConfig.validateEnv();

  final client = Client();
  client
      .setEndpoint(dotenv.env['APPWRITE_API_ENDPOINT']!)
      .setProject(dotenv.env['APPWRITE_PROJECT_ID']!);

  return client;
}

// Service instances
@riverpod
Account appwriteAccount(Ref ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
}

@riverpod
Databases appwriteDatabase(Ref ref) {
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
}

@riverpod
Storage appwriteStorage(Ref ref) {
  final client = ref.watch(appwriteClientProvider);
  return Storage(client);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final account = ref.watch(appwriteAccountProvider);
  final databases = ref.watch(appwriteDatabaseProvider);
  return AuthRepository(account, databases);
}
