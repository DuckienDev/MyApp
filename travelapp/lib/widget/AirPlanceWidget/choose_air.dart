import 'package:flutter/material.dart';

class ChooseAir extends StatelessWidget {
  const ChooseAir({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(Icons.circle_sharp),
                  SizedBox(width: 10),
                  Text('Round-Trip'),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(Icons.person_outlined),
                  SizedBox(width: 8),
                  Text('1'),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 1,
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(Icons.airplane_ticket_outlined),
                  SizedBox(width: 10),
                  Text('Economy Ticket '),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
