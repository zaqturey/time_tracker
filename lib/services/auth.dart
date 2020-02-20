import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  // Below method return a User from an Object of type 'FirebaseUser'
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  // Note: '_firebaseAuth.onAuthStateChanged' returns a Stream of 'Stream<FirebaseUser>' but our
  // below getter returns a 'Stream<User>', there for we need to convert the 'Stream<FirebaseUser>' to
  // 'Stream<User>' by using the 'map' method that (using a 'Converter' method, e.g. '_userFromFirebase' in this case)
  // converts a Stream/Collection of one type to Stream/Collection of another type
  Stream<User> get onAuthStateChanged {
    // return _firebaseAuth.onAuthStateChanged.map((firebaseUser) => _userFromFirebase(firebaseUser));
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  // Changing return type from 'FirebaseUser' to 'User'
  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  // Changing return type from 'FirebaseUser' to 'User'
  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
