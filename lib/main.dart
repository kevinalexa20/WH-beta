import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wh_mobile/src/app.dart';
import 'package:wh_mobile/src/utils/appwrite_client.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  AppwriteConfig.validateEnv();
  runApp(ProviderScope(child: MyApp()));
}
