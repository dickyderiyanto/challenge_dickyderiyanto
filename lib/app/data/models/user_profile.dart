import 'dart:convert';

class UserProfile {
  String name;
  String email;
  String gender;
  String dateOfBirth;
  int height;
  int weight;
  String? profilePicture;

  UserProfile({
    required this.name,
    required this.email,
    required this.gender,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    this.profilePicture,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'height': height,
      'weight': weight,
      'profile_picture': profilePicture,
      '_method': 'PUT',
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth: json['date_of_birth'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      profilePicture: json['profile_picture'],
    );
  }

  String toJson() => json.encode(toMap());
}
