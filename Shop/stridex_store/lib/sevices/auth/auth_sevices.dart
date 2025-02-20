import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../models/profile.dart';
import '../../navigators/bottomnav.dart';

class AuthSevices {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //UID
  String? currentUser() {
    return _auth.currentUser?.uid;
  }
 //Email
  String? emailUser() {
    return _auth.currentUser?.email;
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
  Future<void> userlogin(
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
  ) async {
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
          email: email.text.trim(), password: password.text.trim());

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
Future<void> userSignUp(
    BuildContext context,
    TextEditingController email,
    TextEditingController password,
    TextEditingController rePassword) async {
  
  // Kiểm tra mật khẩu
  if (password.text.trim() != rePassword.text.trim()) {
    _showSnackBar(context, "Please check your password again.", Colors.red);
    return;
  }

  // Hiển thị loading
  _showLoadingDialog(context);

  try {
    // Đăng ký tài khoản Firebase
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    // Tạo profile mặc định
    Profile profile = Profile(
      id: userCredential.user?.uid ?? '',
      name: 'No name',
      dateOfBirth: 'dd/yy/mmmm',
      phoneNumber: 'No Phone',
      email: email.text.trim(),
      addRess: 'No Add Ress',
    );

    // Lưu vào Firestore
    await _firestore.collection('user').doc(profile.id).set(profile.toMap());

    // Đóng dialog và hiển thị thông báo thành công
    if (context.mounted) {
      Navigator.pop(context);
      _showSnackBar(context, "Sign Up successfully.", Colors.black);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
    }
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context); // Đóng dialog trước khi hiển thị lỗi
    _handleAuthError(context, e);
  }
}

// 🏷 Hiển thị thông báo SnackBar
void _showSnackBar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    ),
  );
}

// 🔄 Hiển thị Dialog Loading
void _showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Ngăn đóng dialog khi chạm ra ngoài
    builder: (context) => const Center(
      child: CircularProgressIndicator(color: Colors.black),
    ),
  );
}

// 🔥 Xử lý lỗi FirebaseAuthException
void _handleAuthError(BuildContext context, FirebaseAuthException e) {
  String errorMessage = "Registration failed.";
  if (e.code == 'email-already-in-use') {
    errorMessage = "This email is already registered.";
  } else if (e.code == 'weak-password') {
    errorMessage = "Password should be at least 6 characters.";
  } else if (e.code == 'invalid-email') {
    errorMessage = "Invalid email format.";
  }
  _showSnackBar(context, errorMessage, Colors.red);
}


//FG Password
  Future<void> forgotPassword(
    BuildContext context,
    TextEditingController email,
  ) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('A password reset email has been sent to $email')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send reset email: ${e.toString()}')),
      );
    }
  }
}
