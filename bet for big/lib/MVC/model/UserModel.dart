class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String image;
  final String? bio;
  final String userType;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.image,
    this.bio,
    required this.userType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      bio: json['bio'],
      userType: json['user_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'bio': bio,
      'user_type': userType,
    };
  }
}

class AuthResponse {
  final UserModel data;
  final String accessToken;

  AuthResponse({
    required this.data,
    required this.accessToken,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: UserModel.fromJson(json['data']),
      accessToken: json['access_token'],
    );
  }
}
