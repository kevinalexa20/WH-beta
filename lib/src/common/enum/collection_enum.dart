import 'package:json_annotation/json_annotation.dart';

// Enum for user roles
enum UserRole {
  @JsonValue('customer')
  customer,

  @JsonValue('merchant')
  merchant,
}

// Enum for item status
enum FoodItemStatus {
  @JsonValue('available')
  available,

  @JsonValue('sold_out')
  soldOut,
}
