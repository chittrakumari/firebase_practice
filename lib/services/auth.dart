import 'package:firebase_auth/firebase_auth.dart'
    show AuthResult, FirebaseAuth, FirebaseUser;
import 'package:firebase_practice/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object from firebaseuser
  
  CustomUser? _userFromFirebaseUser(FirebaseUser user){

    return user!=null?CustomUser(uid: user.uid):null;

  }

  //Using Streams
  Stream<CustomUser?> get user  {
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

  // register with email and password

  // sign out
Future signOut() async{
    try {
      return await _auth.signOut();
    }
    catch(e){
print(e.toString());
return null;
    }
}

}
