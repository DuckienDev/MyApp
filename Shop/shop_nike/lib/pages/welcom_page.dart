import 'package:flutter/material.dart';
import 'package:shop_nike/pages/sign_in_page.dart';
import 'package:shop_nike/widgets/my_button.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //LOGO
              Hero(
                tag: 'nike-swoosh-logo.png',
                child: SizedBox(
                  width: 300,
                  child: Image.asset('assets/img/nike-swoosh-logo.png'),
                ),
              ),
              // Title
              const Column(
                children: [
                  Text(
                    'Just Do It',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Brand new sneaker and custom kicks made with premium quality',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              //NAVIGATO HOMEPAGE
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SignIn(),
                    ),
                  );
                },
                child: MyButton(name: 'Start'),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
