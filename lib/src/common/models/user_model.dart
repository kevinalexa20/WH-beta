import 'package:json_annotation/json_annotation.dart';

import '../common.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '\$id')
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;

  @JsonKey(defaultValue: UserRole.customer)
  final UserRole role;

  @JsonKey(name: '\$createdAt')
  final DateTime? createdAt;

  @JsonKey(name: '\$updatedAt')
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.role = UserRole.customer,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    UserRole? role,
    String? phoneNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.role == role &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode {
    return Object.hash(id, name, email, role, phoneNumber);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, role: $role, phoneNumber: $phoneNumber)';
  }
}
