import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  // Below method return a User from an Object of type 'FirebaseUser'
  User _userFromFirebase(FirebaseUser firebaseUser) {
    if (firebaseUser == null) {
      return null;
    }
    // return User(uid: firebaseUser.uid);
    // OR
    String userUid = firebaseUser.uid;
    return User(uid: userUid);
  }

  // Note: '_firebaseAuth.onAuthStateChanged' returns a Stream of 'Stream<FirebaseUser>' but our
  // below getter returns a 'Stream<User>', therefore we need to convert the 'Stream<FirebaseUser>' to
  // 'Stream<User>' by using the 'map' method that (using a map (Converter) method, e.g. '_userFromFirebase')
  // converts a Stream/Collection of (e.g. <FirebaseUser>) one type to Stream/Collection of another type (e.g. <User>)
  @override
  Stream<User> get onAuthStateChanged {
    // return _firebaseAuth.onAuthStateChanged.map((firebaseUser) => _userFromFirebase(firebaseUser));
    // OR
    // return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
    // OR (the below code)
    Stream<FirebaseUser> firebaseUserStream = _firebaseAuth.onAuthStateChanged;
    Stream<User> userStream = firebaseUserStream.map(_userFromFirebase);
    return userStream;
  }

  // Changing return type from 'FirebaseUser' to 'User' for 'currentUser()'
  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  // Changing return type from 'FirebaseUser' to 'User' for 'signInAnonymously()'
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
