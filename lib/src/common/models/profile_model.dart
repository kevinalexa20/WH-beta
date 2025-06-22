import 'dart:math' as math;

import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: '\$id')
  final String id;

  final String userId;
  final String merchantName;
  final String? description;
  final String address;
  final double latitude;
  final double longitude;
  final String? profilePictureUrl;
  final String? phoneNumber;

  @JsonKey(name: '\$createdAt')
  final DateTime? createdAt;

  @JsonKey(name: '\$updatedAt')
  final DateTime? updatedAt;

  const ProfileModel({
    required this.id,
    required this.userId,
    required this.merchantName,
    this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.profilePictureUrl,
    this.createdAt,
    this.updatedAt,
    this.phoneNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$ProfileModelToJson(this);
    // Hapus field sistem dari JSON sebelum mengirim ke Appwrite
    json.remove('\$id');
    json.remove('\$createdAt');
    json.remove('\$updatedAt');
    return json;
  }

  ProfileModel copyWith({
    String? id,
    String? userId,
    String? merchantName,
    String? description,
    String? address,
    double? latitude,
    double? longitude,
    String? profilePictureUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      merchantName: merchantName ?? this.merchantName,
      description: description ?? this.description,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Helper method untuk menghitung jarak
  double distanceTo(double userLatitude, double userLongitude) {
    // Implementasi Haversine formula untuk menghitung jarak
    const double earthRadius = 6371; // Radius bumi dalam km

    double dLat = _degreesToRadians(userLatitude - latitude);
    double dLon = _degreesToRadians(userLongitude - longitude);

    double a =
        (math.sin(dLat / 2) * math.sin(dLat / 2)) +
        (math.cos(_degreesToRadians(latitude)) *
            math.cos(_degreesToRadians(userLatitude)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2));

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileModel &&
        other.id == id &&
        other.userId == userId &&
        other.merchantName == merchantName &&
        other.description == description &&
        other.address == address &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      userId,
      merchantName,
      description,
      address,
      latitude,
      longitude,
      profilePictureUrl,
    );
  }

  @override
  String toString() {
    return 'ProfileModel(id: $id, userId: $userId, merchantName: $merchantName, address: $address, lat: $latitude, lng: $longitude)';
  }
}
