import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gemini_ai/pages/%C2%A0welcome_page.dart';
import 'package:gemini_ai/pages/home_page.dart';
import 'package:gemini_ai/service/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const WelcomePage();
          }
        },
      ),
    );
  }
}

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication?.idToken,
        accessToken: googleSignInAuthentication?.accessToken);
    UserCredential result = await firebaseAuth.signInWithCredential(credential);
    User? userDetails = result.user;
    Map<String, dynamic> userInfoMap = {
      "email": userDetails!.email,
      "name": userDetails.displayName,
      "imgUrl": userDetails.photoURL,
      "id": userDetails.uid,
    };
    await DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}
