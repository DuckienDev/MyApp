import 'package:flutter/material.dart';

class ConfirmOder extends StatelessWidget {
  const ConfirmOder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Please confirm your order !",
        style: TextStyle(fontSize: 17, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
