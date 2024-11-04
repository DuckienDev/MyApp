import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/models/profile.dart';
import 'package:shop_nike/navigators/bottomnav.dart';

class AuthSevices {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
  
//SIGN IN
 Future<void> userlogin(BuildContext context,TextEditingController email,TextEditingController password,) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.black,
              size: 40,
            ),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Sign in successfully.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ));
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("User found for that email."),
          backgroundColor: Color.fromARGB(255, 234, 98, 88),
        ));
      } else if (e.code == 'wrong- password') {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wrong password."),
            backgroundColor: Color.fromARGB(255, 234, 98, 88),
          ),
        );
      }
    }
  }

//SIGN UP
  Future<void>  userSignUp(BuildContext context,TextEditingController email,TextEditingController password,TextEditingController Repassword) async {
    //CHECK PW
    if (password.text.trim() != Repassword.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please check your password again."),
        backgroundColor: Color.fromARGB(255, 234, 98, 88),
      ));
      return;
    }
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.black,
              size: 40,
            ),
          );
        });
    try {
      //SIGN UP
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.text.trim(),
              password: password.text.trim());

      Profile profile = Profile(
        id: userCredential.user?.uid ?? '',
        name: 'No name',
        dateOfBirth: 'dd/yy/mmmm',
        phoneNumber: 'No Phone',
        email: email.text.trim(),
        addRess: 'No Add Ress',
      );
      //CREATE USER FIRESTORE
      await _firestore.collection('user').doc(profile.id).set(profile.toMap());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Sign Up successfully.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
      );
      Navigator.pop(context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
      //SIGN UP FAILED
    } on FirebaseAuthException {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Registration failed.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 98, 88),
      ));
    }
  }

//FG Password
 Future<void> forgotPassword(BuildContext context,TextEditingController email,) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('A password reset email has been sent to $email')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send reset email: ${e.toString()}')),
      );
    }
  }
  
}
