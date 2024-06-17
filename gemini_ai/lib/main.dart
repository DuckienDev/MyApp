import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_ai/api/firebase_api.dart';
import 'package:gemini_ai/firebase_options.dart';
import 'package:gemini_ai/pages/notification_page.dart';
import 'package:gemini_ai/service/auth.dart';
import 'package:gemini_ai/theme/consts.dart';
import 'package:gemini_ai/theme/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const AuthPage(),
      navigatorKey: navigatorKey,
      routes: {
        "/notification_screen": (context) => const NotificationPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
