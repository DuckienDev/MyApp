import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/models/profile.dart';
import 'package:shop_nike/navigators/bottomnav.dart';
import 'package:shop_nike/pages/sign_in_page.dart';
import 'package:shop_nike/widgets/my_button.dart';
import 'package:shop_nike/widgets/my_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _RepwController = TextEditingController();

  userSignUp() async {
    //CHECK PW
    if (_pwController.text != _RepwController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please check your password again."),
        backgroundColor: Color.fromARGB(255, 234, 98, 88),
      ));
      return;
    }
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
      //SIGN UP
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _pwController.text.trim());

      Profile profile = Profile(
        id: userCredential.user?.uid ?? '',
        name: 'No name',
        dateOfBirth: 'dd/yy/mmmm',
        phoneNumber: 'No Phone',
        email: _emailController.text.trim(),
        addRess: 'No Add Ress',
      );
      //CREATE USER FIRESTORE
      await _firestore.collection('user').doc(profile.id).set(profile.toMap());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Sign Up successfully.",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
      );
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
      //SIGN UP FAIL
    } on FirebaseAuthException {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Registration failed.",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 234, 98, 88),
      ));
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
                  MyTextField(
                    controller: _RepwController,
                    hintText: 'Re-enter password',
                    obscureText: true,
                  ),
                  GestureDetector(
                    onTap: () {
                      userSignUp();
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
