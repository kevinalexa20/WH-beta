// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodItemModel _$FoodItemModelFromJson(Map<String, dynamic> json) =>
    FoodItemModel(
      id: json[r'$id'] as String,
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      itemName: json['itemName'] as String,
      itemDescription: json['itemDescription'] as String?,
      originalPrice: (json['originalPrice'] as num).toInt(),
      discountPrice: (json['discountPrice'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      pickupTime: json['pickupTime'] as String?,
      status:
          $enumDecodeNullable(_$FoodItemStatusEnumMap, json['status']) ??
          FoodItemStatus.available,
      itemPictureUrl: json['itemPictureUrl'] as String?,
      createdAt: json[r'$createdAt'] == null
          ? null
          : DateTime.parse(json[r'$createdAt'] as String),
      updatedAt: json[r'$updatedAt'] == null
          ? null
          : DateTime.parse(json[r'$updatedAt'] as String),
    );

Map<String, dynamic> _$FoodItemModelToJson(FoodItemModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'profile': instance.profile,
      'itemName': instance.itemName,
      'itemDescription': instance.itemDescription,
      'itemPictureUrl': instance.itemPictureUrl,
      'originalPrice': instance.originalPrice,
      'discountPrice': instance.discountPrice,
      'quantity': instance.quantity,
      'pickupTime': instance.pickupTime,
      'status': _$FoodItemStatusEnumMap[instance.status]!,
      r'$createdAt': instance.createdAt?.toIso8601String(),
      r'$updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$FoodItemStatusEnumMap = {
  FoodItemStatus.available: 'available',
  FoodItemStatus.soldOut: 'sold_out',
};
