import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/widget/AirPlanceWidget/app_bar_air.dart';
import 'package:travelapp/widget/AirPlanceWidget/choose_air.dart';
import 'package:travelapp/widget/AirPlanceWidget/select_trip_air.dart';
import 'package:travelapp/widget/HomeWidget/home_cities_list.dart';

class AirPlanceScreen extends StatelessWidget {
  const AirPlanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: AppBarAir(),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 120,
                child: Image(
                  image: AssetImage('images/Logo/airlogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Flight',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const ChooseAir(),
              const SizedBox(height: 10),
              const SelectTripAir(),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, color: Colors.black)
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Where do you want to go today?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Text('Search'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              HomeMain(),
            ],
          ),
        ],
      ),
    );
  }
}
