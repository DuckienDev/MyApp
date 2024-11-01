// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String name;
  Color colorText;
  Color colorButton;
  MyButton(
      {super.key,
      required this.name,
      this.colorText = Colors.white,
      this.colorButton = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: Colors.black),
        color: colorButton,
      ),
      padding: const EdgeInsets.all(18),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
