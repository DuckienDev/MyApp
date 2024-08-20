import 'package:provider/provider.dart';
import 'package:spaces2/spaces2.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/home_page.dart';
import 'package:todoapp/themes/theme_provider.dart';

void main() {
  runApp(
    Spacing.fixed(
      data: SpacingData.generate(16),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
