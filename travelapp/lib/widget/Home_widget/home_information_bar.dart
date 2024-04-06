import 'package:flutter/material.dart';

class InformationBar extends StatefulWidget {
  const InformationBar({
    super.key,
  });

  @override
  State<InformationBar> createState() => _InformationBarState();
}

class _InformationBarState extends State<InformationBar> {
  var category = [
    'Best plances',
    'Most vistited',
    'Favorites',
    'Hotels',
    'Restaurants',
    'New Adds',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            for (int i = 0; i < 6; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 2),
                  ],
                ),
                child: Text(
                  '${category[i]}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
