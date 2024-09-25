import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyProduct extends StatelessWidget {
  String img;
  String name;
  String price;
  String status;
  MyProduct({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 203, 203, 203),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                Text('$price USD',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text(status),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
