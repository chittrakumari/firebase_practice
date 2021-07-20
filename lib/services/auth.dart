import 'package:firebase_auth/firebase_auth.dart'
    show AuthResult, FirebaseAuth, FirebaseUser;
import 'package:firebase_practice/models/user.dart';
import 'package:firebase_practice/services/DatabaseService.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object from firebaseuser

  CustomUser? _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //Using Streams
  Stream<CustomUser?> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new member', 100);
      return _userFromFirebaseUser(user);
      
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
