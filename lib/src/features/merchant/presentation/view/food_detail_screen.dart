import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/common/constants/height_spacer.dart';
import 'package:wh_mobile/src/features/merchant/presentation/controller/food_controller.dart';

class FoodDetailScreen extends ConsumerWidget {
  final String foodItemId;

  const FoodDetailScreen({super.key, required this.foodItemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    
    final foodDetailState = ref.watch(foodDetailProvider(foodItemId));
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
        title: const Text('Detail Makanan'),
      ),
      // 2. Gunakan .when untuk menangani semua state
      body: foodDetailState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (foodItem) {
          // 3. Jika data berhasil didapat, bangun UI detail
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Makanan
                Container(
                  height: 250.h,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: foodItem.itemPictureUrl != null
                      ? Image.network(
                          foodItem.itemPictureUrl!,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.fastfood,
                          color: Colors.grey,
                          size: 80,
                        ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama Makanan
                      Text(
                        foodItem.itemName ?? 'Nama Makanan',
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const HeightSpacer(height: 8),
                      // Harga
                      Row(
                        children: [
                          Text(
                            foodItem.formattedDiscountedPrice,
                            style: textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (foodItem.discountPercentage > 0)
                            Text(
                              foodItem.formattedOriginalPrice,
                              style: textTheme.titleLarge?.copyWith(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      const HeightSpacer(height: 8),
                      // Kuantitas
                      Text(
                        'Sisa: ${foodItem.quantity} porsi',
                        style: textTheme.bodyLarge,
                      ),
                      const Divider(height: 32),
                      // Informasi Merchant
                      Text('Dijual oleh:', style: textTheme.titleMedium),
                      const HeightSpacer(height: 8),
                      ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.store)),
                        title: Text(
                          foodItem.profile?.merchantName ?? 'Nama Warung',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          foodItem.profile?.address ?? 'Alamat tidak tersedia',
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      const Divider(height: 32),
                      // Deskripsi
                      Text('Deskripsi', style: textTheme.titleMedium),
                      const HeightSpacer(height: 8),
                      Text(
                        foodItem.itemDescription ??
                            'Tidak ada deskripsi untuk makanan ini.',
                        style: textTheme.bodyLarge,
                      ),

                      const HeightSpacer(height: 24),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: colorScheme.primary),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mau order?',
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            const HeightSpacer(height: 4),
                            Text(
                              'Hubungi penjual di nomor:',
                              style: textTheme.bodyMedium,
                            ),
                            const HeightSpacer(height: 8),
                            SelectableText(
                              // Tampilkan nomor telepon atau pesan default jika tidak ada
                              foodItem.profile?.phoneNumber ??
                                  'Nomor tidak tersedia',
                              style: textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
