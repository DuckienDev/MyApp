// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool obscureText;
  int maxLeng;
  TextInputType keyboardType;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.maxLeng = 50,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        obscureText: obscureText,
        maxLength: maxLeng,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter $hintText!";
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          border: InputBorder.none,
          hintText: " ${hintText}",
  
          hintStyle: Theme.of(context).textTheme.displaySmall,
        ),
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }
}
