// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../services/mock.dart';

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String imageURL;
  final String uid;
  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageURL,
    required this.uid,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? imageURL,
    String? uid,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      imageURL: imageURL ?? this.imageURL,
      uid: uid ?? this.uid,
    );
  }
  
  static User createMockUser() {
    return User(
      firstName: Mock.firstName(),
      lastName: Mock.lastName(),
      email: Mock.email(),
      imageURL: Mock.imageUrl(),
      uid: Mock.uid(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'imageURL': imageURL,
      'uid': uid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      imageURL: map['imageURL'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(firstName: $firstName, lastName: $lastName, email: $email, imageURL: $imageURL, uid: $uid)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.imageURL == imageURL &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      imageURL.hashCode ^
      uid.hashCode;
  }
}
