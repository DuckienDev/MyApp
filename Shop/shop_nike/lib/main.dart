import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shop_nike/conts.dart';
import 'package:shop_nike/sevices/auth/auth_gate.dart';
import 'package:shop_nike/sevices/provider.dart';
import 'package:shop_nike/themes/dark_mode.dart';
import 'sevices/firestore/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
       const AuthGate(),
      theme: darkMode,
    );
  }
}
