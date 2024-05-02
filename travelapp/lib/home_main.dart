import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/mockup/item_mockup.dart';
import 'package:travelapp/screen/favorite_screen.dart';
import 'package:travelapp/screen/home_screen.dart';
import 'package:travelapp/screen/frofile_screen.dart';
import 'package:travelapp/screen/airplance_screen.dart';
import 'package:travelapp/screen/hotel_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Container(child: HomeProfile()),
          Container(child: FavorieScreen(item: dataLocation.first)),
          Container(child: HomeScreen()),
          Container(child: HotelScreen()),
          Container(child: AirPlanceScreen()),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.transparent,
        items: [
          InkWell(child: Icon(Icons.person_outline, size: 25)),
          Icon(Icons.favorite_outline, size: 25),
          Icon(Icons.home, size: 25, color: Colors.red),
          Icon(Icons.hotel_class_outlined, size: 25),
          Icon(Icons.airplanemode_active, size: 25),
        ],
      ),
    );
  }
}
