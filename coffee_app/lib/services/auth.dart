import 'package:coffee_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _comingFromFirebase(FirebaseUser fUser) {
    return fUser != null ? User(userId: fUser.uid) : null;
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _comingFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future register(String mail, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: mail, password: password);

      FirebaseUser user = result.user;
      return _comingFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String mail, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: mail, password: password);

      FirebaseUser user = result.user;
      return _comingFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_comingFromFirebase);
  }
}
