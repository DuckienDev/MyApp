import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp/screen/forgot_pw_screen.dart';

class LogInScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LogInScreen({super.key, required this.showRegisterPage});

  @override
  State<LogInScreen> createState() => _LogInScreen();
}

class _LogInScreen extends State<LogInScreen> {
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  Future SignIn() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 170, 235, 255)));
        });

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailControler.text.trim(),
      password: _passwordControler.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailControler.dispose();
    _passwordControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //animation
              Container(
                width: double.infinity,
                height: 300,
                child:
                    Lottie.asset('images/home/Animation - 1714962010094.json'),
              ),
              //Just go
              Text(
                'Just go!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 20),
              //text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '    A trip is an exciting adventure where we leave everyday '
                  'life to explore new lands. It could be a journey to vibrant cities, '
                  'quiet beaches, or even challenging high mountains.During the trip, '
                  'we enjoy memorable moments from trying local dishes,watching the '
                  'sunset over the sea, to meeting new friends and learning about their '
                  'unique culture.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(height: 20),
              //email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _emailControler,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 20),
              //password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _passwordControler,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text(
                        'Forgot password ?',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              //sign in
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: SignIn,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 170, 235, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //not a member?register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      ' Register now.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
