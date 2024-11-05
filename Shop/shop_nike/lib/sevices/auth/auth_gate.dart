import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_nike/navigators/bottomnav.dart';
import 'package:shop_nike/pages/welcom_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNav();
          } else {
            return const WelcomPage();
          }
        },
      ),
    );
  }
}
