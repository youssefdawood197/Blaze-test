import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Users.dart'; // Ensure this points to the correct UserModel class

class FirebaseAuthHandler {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register a new user with email & password and store user details in Firestore
  Future<String?> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String gender,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      // Create a user with email & password in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        String uid = firebaseUser.uid; // Firebase-generated user ID

        // Create a new UserModel object
        UserModel newUser = UserModel(
          uid: uid, // Store UID for reference
          firstName: firstName,
          lastName: lastName,
          email: email,
          username: username,
          gender: gender,
          phoneNumber: phoneNumber,
        );

        // Save user data to Firestore in the `users` collection
        await _firestore.collection('users').doc(uid).set(newUser.toFirestore());

        return uid; // Return user ID if successful
      } else {
        return "User creation failed: No user found after registration.";
      }
    } catch (e) {
      print('Error during registration: $e'); // Debugging log
      return e.toString(); // Return error message
    }
  }
}