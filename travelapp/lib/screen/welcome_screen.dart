import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/home_main.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/home/home_welcome.jpg'),
            fit: BoxFit.cover,
            opacity: 0.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Just go!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontFamily: 'Campana',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'A trip is an exciting adventure where we leave everyday '
                  'life to explore new lands. It could be a journey to vibrant cities,'
                  'quiet beaches, or even challenging high mountains.During the trip,'
                  'we enjoy memorable moments: from trying local dishes, watching the '
                  'sunset over the sea, to meeting new friends and learning about their '
                  'unique culture.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Ink(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: 23,
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Continue with Facebook',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ]),
                      ),
                      SizedBox(height: 20),
                      Ink(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(children: [
                          SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                'images/Logo/Google.png',
                              )),
                          SizedBox(width: 40),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )
                        ]),
                      ),
                      SizedBox(height: 20),
                      Ink(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(children: [
                          Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Continue with Apple',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
