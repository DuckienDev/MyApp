import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gemini_ai/pages/forgot_pw_page.dart';
import 'package:gemini_ai/pages/home_page.dart';
import 'package:gemini_ai/service/auth.dart';
import 'package:gemini_ai/theme/consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailControler = TextEditingController();

  final passwordControler = TextEditingController();

  userlogin() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary));
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text, password: passwordControler.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sign in successfully.")));
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("User found for that email."),
          backgroundColor: Color.fromARGB(255, 234, 98, 88),
        ));
      } else if (e.code == 'wrong- password') {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Wrong password."),
          backgroundColor: Color.fromARGB(255, 234, 98, 88),
        ));
      }
    }
  }

  // ignore: unrelated_type_equality_checks
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Hero(
            tag: '234',
            child: SizedBox(
              width: 300,
              height: 100,
              child: Image.asset(
                'image/logo_gemini.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email!";
                    }
                    return null;
                  },
                  controller: emailControler,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter password!";
                    }
                    return null;
                  },
                  controller: passwordControler,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    iconAlignment: IconAlignment.end,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPwPage()));
                    },
                    child: Text(
                      ' Forgot password?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                GestureDetector(
                  onTap: () {
                    userlogin();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      gradient: const LinearGradient(
                        colors: ColorsLinearGradient,
                      ),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Sign In with",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    AuthMethods().signInWithGoogle(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      color: Colors.white,
                    ),
                    width: 50,
                    height: 50,
                    child: Center(
                      child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1024px-Google_%22G%22_logo.svg.png')),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        ' Return',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
