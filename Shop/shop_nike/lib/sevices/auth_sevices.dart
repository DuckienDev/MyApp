import 'package:firebase_auth/firebase_auth.dart';

class AuthSevices {
  final _auth = FirebaseAuth.instance;
  //UID
  String? currentUser() {
    return _auth.currentUser?.uid;
  }

  //LOGOUT
  Future<void> logout() async {
    try {
      await _auth.signOut();
      print("Log out successfully");
    } catch (e) {
      print("Error log out: $e");
    }
  }
}
