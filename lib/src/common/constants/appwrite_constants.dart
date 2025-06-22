import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppwriteConstants {
  static final String endpoint = dotenv.env['APPWRITE_API_ENDPOINT']!;
  static final String projectId = dotenv.env['APPWRITE_PROJECT_ID']!;
  static final String databaseId = dotenv.env['APPWRITE_DATABASE_ID']!;
  static final String usersCollectionId = dotenv.env['USERS_COLLECTION_ID']!;
  static final String profilesCollectionId =
      dotenv.env['PROFILES_COLLECTION_ID']!;
  static final String foodItemsCollectionId =
      dotenv.env['FOOD_ITEMS_COLLECTION_ID']!;
}
