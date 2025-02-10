import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String firstName;
  String lastName;
  String email;
  String username;
  String gender;
  String phoneNumber;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.gender,
    required this.phoneNumber,
  });

  factory UserModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return UserModel(
      uid: doc.id, // Assign document ID (UID)
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      email: data['email'] ?? '',
      username: data['username'] ?? '',
      gender: data['gender'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid, // Store UID
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'username': username,
      'gender': gender,
      'phoneNumber': phoneNumber,
    };
  }
}