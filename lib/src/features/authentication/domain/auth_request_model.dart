import 'package:wh_mobile/src/common/common.dart';

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class RegisterRequest {
  final String name;
  final String email;
  final String password;
  final String? phoneNumber;
  final UserRole role;

  const RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    this.phoneNumber,
    this.role = UserRole.customer,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    if (phoneNumber != null) 'phone': phoneNumber,
  };

  // Method untuk convert ke UserModel setelah register berhasil
  UserModel toUserModel({required String id}) {
    return UserModel(
      id: id,
      name: name,
      email: email,
      role: role,
      phoneNumber: phoneNumber,
    );
  }
}

// Response models dari Appwrite Auth
class AuthResponse {
  final String userId;
  final String sessionId;
  final UserModel user;

  const AuthResponse({
    required this.userId,
    required this.sessionId,
    required this.user,
  });

  factory AuthResponse.fromAppwrite({
    required String userId,
    required String sessionId,
    required UserModel user,
  }) {
    return AuthResponse(userId: userId, sessionId: sessionId, user: user);
  }
}

// State models untuk UI
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final UserModel? currentUser;
  final ProfileModel? currentProfile;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.currentUser,
    this.currentProfile,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    UserModel? currentUser,
    ProfileModel? currentProfile,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      currentUser: currentUser ?? this.currentUser,
      currentProfile: currentProfile ?? this.currentProfile,
      error: error,
    );
  }
}
