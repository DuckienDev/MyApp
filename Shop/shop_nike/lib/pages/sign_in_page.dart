import 'package:flutter/material.dart';
import 'package:shop_nike/pages/forgot_pw_page.dart';
import 'package:shop_nike/pages/sign_up_page.dart';
import 'package:shop_nike/sevices/auth/auth_sevices.dart';
import 'package:shop_nike/widgets/my_button.dart';
import 'package:shop_nike/widgets/my_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthSevices auth = AuthSevices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

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
                  child: Image.asset('assets/img/nike-swoosh-logo.png'),
                ),
              ),
              Column(
                children: [
                  MyTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  MyTextField(
                    controller: _pwController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPwPage()));
                        },
                        child: Text(
                          'Forgot password ?',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      auth.userlogin(context, _emailController, _pwController);
                    },
                    child: MyButton(name: 'Sign In'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have an account ?',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        },
                        child: const Text(
                          'Sign Up',
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
