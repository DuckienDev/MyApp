import 'package:flutter/material.dart';
import 'package:stridex_store/pages/sign_in_page.dart';

import '../sevices/auth/auth_sevices.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthSevices auth = AuthSevices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _RepwController = TextEditingController();

//UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 100,
              ),
              Hero(
                tag: 'nike-swoosh-logo.png',
                child: SizedBox(
                  width: 300,
                  child: Image.asset('assets/img/logoStrideX-Photoroom.png'),
                ),
              ),
              Column(
                children: [
                  MyTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    obscureText: false,
                  ),
                  MyTextField(
                    controller: _pwController,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  MyTextField(
                    controller: _RepwController,
                    labelText: 'Re-enter password',
                    obscureText: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      auth.userSignUp(
                        context,
                        _emailController,
                        _pwController,
                        _RepwController,
                      );
                    },
                    child: MyButton(name: 'Sign Up'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You already have an account ?',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
