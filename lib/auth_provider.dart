import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user; // Declare _user as an instance variable

  // Getter for current user
  User? get currentUser => _auth.currentUser;

  // Getter for _user
  User? get user => _user;
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Add print statements for debugging
      print("User signed up successfully: ${result.user?.email}");
    } catch (e) {
      // Add print statements for debugging
      print("Error during sign up: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();

    // Reset _user and notify listeners
    _user = null;
    notifyListeners();
  }
}
