import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wh_mobile/src/features/authentication/presentation/controller/auth_controller.dart';

// 1. Ubah menjadi ConsumerWidget untuk akses ke Riverpod
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Awasi state untuk menampilkan loading saat proses logout
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade700,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          // 3. Panggil method logout dari AuthController
          onPressed: authState.isLoading
              ? null
              : () {
                  ref.read(authControllerProvider.notifier).logout();
                },
          child: authState.isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text('Logout'),
        ),
      ),
    );
  }
}
