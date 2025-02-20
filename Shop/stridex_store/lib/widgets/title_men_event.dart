import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleMenEvent extends StatelessWidget {
  String image;
  String title;
  TitleMenEvent({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 150,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Introducing Nike24.7 Collection",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto2',
          ),
        ),
        const Text(
          "A new collection feature polished looks and a luxurious feel.",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }
}
