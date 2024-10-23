
import 'package:flutter/material.dart';

class MyEvent extends StatelessWidget {
  const MyEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Container(
          height: 500,
          width: double.infinity,
          color: Colors.grey,
          child: Image.network(
            'https://d1tm14lrsghf7q.cloudfront.net/public/media/103043/conversions/Nike-Join-Forces-Diablo-Paris-3-thumb.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nike Store',
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Text(
                'STADIUM 90',
                style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Explore',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}