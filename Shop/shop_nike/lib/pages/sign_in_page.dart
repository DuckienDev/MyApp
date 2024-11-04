import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/navigators/bottomnav.dart';
import 'package:shop_nike/pages/sign_up_page.dart';
import 'package:shop_nike/widgets/my_button.dart';
import 'package:shop_nike/widgets/my_text_field.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwController = TextEditingController();

  userlogin() async {
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
          email: _emailController.text.trim(),
          password: _pwController.text.trim());

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
                        onPressed: () {},
                        child: Text(
                          'Forgot password ?',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      userlogin();
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
