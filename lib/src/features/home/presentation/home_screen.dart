import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wh_mobile/src/common/constants/height_spacer.dart';
import 'package:wh_mobile/src/features/authentication/presentation/controller/auth_controller.dart';
import 'package:wh_mobile/src/features/home/presentation/controller/location_controller.dart';
import 'package:wh_mobile/src/features/merchant/presentation/controller/food_controller.dart';
import 'package:wh_mobile/src/features/merchant/presentation/widget/food_item_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  Widget _buildLocationDisplay(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LOKASI SAAT INI',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(text, style: const TextStyle(fontSize: 16)),
            const Icon(Icons.arrow_drop_down, size: 20),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    // Awasi state otentikasi untuk menampilkan nama pengguna
    final authState = ref.watch(authControllerProvider);
    // Awasi FoodController. Ini akan memicu pengambilan data dan pengurutan.
    final foodItemsState = ref.watch(foodControllerProvider);
    final locationState = ref.watch(userLocationNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: locationState.when(
          loading: () => _buildLocationDisplay('Mencari lokasi...'),
          error: (err, st) => _buildLocationDisplay('Lokasi tidak aktif'),
          data: (placemark) {
            // Tampilkan nama kecamatan atau kota
            final locationName =
                placemark.subLocality ?? placemark.locality ?? 'Lokasi Anda';
            return _buildLocationDisplay(locationName);
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        // Gunakan RefreshIndicator untuk memicu pembaruan data
        onRefresh: () => ref.refresh(foodControllerProvider.future),
        child: ListView(
          padding: const EdgeInsets.only(top: 16),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: authState.when(
                data: (data) => Text(
                  'Hi, ${data.currentUser?.name ?? 'Guest'}!',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                loading: () => const SizedBox.shrink(),
                error: (e, st) => const Text('Hi, Guest!'),
              ),
            ),
            const HeightSpacer(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Diskon Terdekat Untukmu',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const HeightSpacer(height: 16),

            // Gunakan .when untuk menampilkan UI berdasarkan state dari FoodController
            foodItemsState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Gagal memuat data: $err'),
                ),
              ),
              data: (foodItems) {
                if (foodItems.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Belum ada makanan tersedia di sekitarmu.'),
                    ),
                  );
                }
                // Jika data tersedia, bangun GridView
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foodItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.7, 
                  ),
                  itemBuilder: (context, index) {
                    final foodItem = foodItems[index];
                    // Kirim objek foodItem ke FoodItemCard
                    return FoodItemCard(foodItem: foodItem);
                  },
                );
              },
            ),
            const HeightSpacer(height: 32), // Beri ruang di bagian bawah
          ],
        ),
      ),
    );
  }
}
