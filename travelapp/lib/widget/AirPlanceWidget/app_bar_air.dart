import 'package:flutter/material.dart';
import 'package:travelapp/home_main.dart';

class AppBarAir extends StatelessWidget {
  const AppBarAir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back_ios)),
        Row(children: [
          Text(
            "Hi, DucKien...",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 10),
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                'https://zpsocial-f52-org.zadn.vn/8114598cc2c0229e7bd1.jpg',
                fit: BoxFit.cover,
              )),
            ),
          ),
        ]),
      ],
    );
  }
}
