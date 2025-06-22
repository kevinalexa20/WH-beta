import 'package:json_annotation/json_annotation.dart';

import '../common.dart';

part 'food_item_model.g.dart';

@JsonSerializable()
class FoodItemModel {
  @JsonKey(name: '\$id')
  final String id;
  // final String profileId;

  //ignore the profile field in JSON serialization
  // @JsonKey(includeFromJson: false, includeToJson: false)
  final ProfileModel? profile; //relationship with ProfileModel
  final String itemName;
  final String? itemDescription;
  final String? itemPictureUrl;
  final int originalPrice;
  final int discountPrice;
  final int quantity;
  final String? pickupTime;

  @JsonKey(defaultValue: FoodItemStatus.available)
  final FoodItemStatus status;

  @JsonKey(name: '\$createdAt')
  final DateTime? createdAt;

  @JsonKey(name: '\$updatedAt')
  final DateTime? updatedAt;

  const FoodItemModel({
    required this.id,
    // required this.profileId,
    this.profile,
    required this.itemName,
    this.itemDescription,
    required this.originalPrice,
    required this.discountPrice,
    required this.quantity,
    this.pickupTime,
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
    String? profileId,
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
      // profileId: profileId ?? this.profileId,
      profile: profile ?? this.profile,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      originalPrice: originalPrice ?? this.originalPrice,
      discountPrice: discountedPrice ?? this.discountPrice,
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
    return ((originalPrice - discountPrice) / originalPrice) * 100;
  }

  String get formattedOriginalPrice {
    return 'Rp ${originalPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  String get formattedDiscountedPrice {
    return 'Rp ${discountPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
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
        other.discountPrice == discountPrice &&
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
      discountPrice,
      quantity,
      pickupTime,
      status,
      itemPictureUrl,
    );
  }

  @override
  String toString() {
    return 'FoodItemModel(id: $id, itemName: $itemName, originalPrice: $originalPrice, discountedPrice: $discountPrice, status: $status)';
  }
}
