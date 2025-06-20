// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  id: json[r'$id'] as String,
  userId: json['userId'] as String,
  merchantName: json['merchantName'] as String,
  description: json['description'] as String?,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  profilePictureUrl: json['profilePictureUrl'] as String?,
  createdAt: json[r'$createdAt'] == null
      ? null
      : DateTime.parse(json[r'$createdAt'] as String),
  updatedAt: json[r'$updatedAt'] == null
      ? null
      : DateTime.parse(json[r'$updatedAt'] as String),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'userId': instance.userId,
      'merchantName': instance.merchantName,
      'description': instance.description,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'profilePictureUrl': instance.profilePictureUrl,
      r'$createdAt': instance.createdAt?.toIso8601String(),
      r'$updatedAt': instance.updatedAt?.toIso8601String(),
    };
