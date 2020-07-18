import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      // print(user);
      return user.uid;
    } catch (e) {
      print("couldn't sign in");
      print(e.toString());
      return null;
    }
  }
}
