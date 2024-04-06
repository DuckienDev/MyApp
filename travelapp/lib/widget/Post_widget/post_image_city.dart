import 'dart:async';
import 'package:flutter/material.dart';

class ImageCity extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImageCity> {
  int _currentIndex = 0;
  List<String> _images = [
    'images/Japan/japan1.jpg',
    'images/Japan/japan2.jpg',
    'images/Japan/japan3.jpg'
  ];
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 2),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          _images[_currentIndex],
          fit: BoxFit.cover,
          height: 100,
        ),
      ),
    );
  }
}
