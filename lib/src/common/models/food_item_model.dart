import 'package:json_annotation/json_annotation.dart';

import '../common.dart';

part 'food_item_model.g.dart';

@JsonSerializable()
class FoodItemModel {
  @JsonKey(name: '\$id')
  final String id;
  final ProfileModel? profile; //relationship with ProfileModel
  final String itemName;
  final String? itemDescription;
  final String? itemPictureUrl;
  final int originalPrice;
  final int discountedPrice;
  final int quantity;
  final String pickupTime;

  @JsonKey(defaultValue: FoodItemStatus.available)
  final FoodItemStatus status;

  @JsonKey(name: '\$createdAt')
  final DateTime? createdAt;

  @JsonKey(name: '\$updatedAt')
  final DateTime? updatedAt;

  const FoodItemModel({
    required this.id,
    this.profile,
    required this.itemName,
    this.itemDescription,
    required this.originalPrice,
    required this.discountedPrice,
    required this.quantity,
    required this.pickupTime,
    required this.status,
    this.itemPictureUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$FoodItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$FoodItemModelToJson(this);

  FoodItemModel copyWith({
    String? id,
    ProfileModel? profile,
    String? itemName,
    String? itemDescription,
    int? originalPrice,
    int? discountedPrice,
    int? quantity,
    String? pickupTime,
    FoodItemStatus? status,
    String? itemPictureUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      quantity: quantity ?? this.quantity,
      pickupTime: pickupTime ?? this.pickupTime,
      status: status ?? this.status,
      itemPictureUrl: itemPictureUrl ?? this.itemPictureUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Helper methods
  double get discountPercentage {
    if (originalPrice == 0) return 0;
    return ((originalPrice - discountedPrice) / originalPrice) * 100;
  }

  String get formattedOriginalPrice {
    return 'Rp ${originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  String get formattedDiscountedPrice {
    return 'Rp ${discountedPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  bool get isAvailable => status == FoodItemStatus.available && quantity > 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodItemModel &&
        other.id == id &&
        other.profile == profile &&
        other.itemName == itemName &&
        other.itemDescription == itemDescription &&
        other.originalPrice == originalPrice &&
        other.discountedPrice == discountedPrice &&
        other.quantity == quantity &&
        other.pickupTime == pickupTime &&
        other.status == status &&
        other.itemPictureUrl == itemPictureUrl;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      profile,
      itemName,
      itemDescription,
      originalPrice,
      discountedPrice,
      quantity,
      pickupTime,
      status,
      itemPictureUrl,
    );
  }

  @override
  String toString() {
    return 'FoodItemModel(id: $id, itemName: $itemName, originalPrice: $originalPrice, discountedPrice: $discountedPrice, status: $status)';
  }
}
