import 'package:time_tracker_flutter_course/services/user.dart';

abstract class AuthBase {
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signInAnonymously();
  Future<void> signOut();
}
