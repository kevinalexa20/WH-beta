import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wh_mobile/src/common/models/food_item_model.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItemModel foodItem;

  const FoodItemCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        context.go('/food-detail/${foodItem.id}');
      },
      
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Makanan
            AspectRatio(
              aspectRatio: 16 / 10,
              child: Container(
                color: Colors.grey.shade300,
                child: foodItem.itemPictureUrl != null
                    ? Image.network(
                        foodItem.itemPictureUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, color: Colors.grey),
                      )
                    : const Icon(Icons.fastfood, color: Colors.grey, size: 40),
              ),
            ),
            // Detail Makanan
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama Makanan
                  Text(
                    foodItem.itemName ?? 'Nama Makanan',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Nama Merchant
                  Text(
                    foodItem.profile?.merchantName ?? 'Nama Warung',
                    style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  // Harga
                  Row(
                    children: [
                      Text(
                        foodItem.formattedDiscountedPrice,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      if (foodItem.discountPercentage > 0)
                        Text(
                          foodItem.formattedOriginalPrice,
                          style: textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
