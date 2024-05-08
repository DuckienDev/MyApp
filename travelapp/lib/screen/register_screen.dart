import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();
  final _confirmPasswordControler = TextEditingController();
  final _fullnameControler = TextEditingController();
  final _dateofbirthControler = TextEditingController();
  final _addressControler = TextEditingController();
  final _numberphoneControler = TextEditingController();

  @override
  void dispose() {
    _emailControler.dispose();
    _passwordControler.dispose();
    _confirmPasswordControler.dispose();
    _addressControler.dispose();
    _fullnameControler.dispose();
    _dateofbirthControler.dispose();
    _numberphoneControler.dispose();

    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailControler.text.trim(),
        password: _passwordControler.text.trim(),
      );
      addUserDetail(
        _fullnameControler.text.trim(),
        _dateofbirthControler.text.trim(),
        _addressControler.text.trim() as Int,
        int.parse(_numberphoneControler.text.trim()) as String,
      );
    }
  }

  Future addUserDetail(
      String name, String dateofbirth, Int numberphone, String Address) async {
    await FirebaseFirestore.instance.collection('user').add({
      'name': name,
      'date of birth': dateofbirth,
      'number phone': numberphone,
      'address': Address,
    });
  }

  bool passwordConfirm() {
    if (_passwordControler.text.trim() == _passwordControler.text.trim()) {
      return true;
    } else {
      return false;
    }
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
                'Welcome!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 45,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please complete all information!',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),

              SizedBox(height: 20),
              //name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _fullnameControler,
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
                    hintText: 'Full Name',
                  ),
                ),
              ),
              SizedBox(height: 20),
              //date of birth
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _dateofbirthControler,
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
                    hintText: 'Date Of Birth',
                  ),
                ),
              ),
              SizedBox(height: 20),
              //number phone
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _numberphoneControler,
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
                    hintText: 'Number Phone',
                  ),
                ),
              ),
              SizedBox(height: 20),
              //Address
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _addressControler,
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
                    hintText: 'Address',
                  ),
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
              SizedBox(height: 20),
              //confirm password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _confirmPasswordControler,
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
                    hintText: 'Confirm Password',
                  ),
                ),
              ),
              SizedBox(height: 20),
              //sign in
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 170, 235, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
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
                    'You have an account?',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      ' Log In.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
