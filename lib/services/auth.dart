import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});
  final String uid;
}

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;

  // Below method return a User from an Object of type 'FirebaseUser'
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  // Changing return type from 'FirebaseUser' to 'User'
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  // Changing return type from 'FirebaseUser' to 'User'
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
