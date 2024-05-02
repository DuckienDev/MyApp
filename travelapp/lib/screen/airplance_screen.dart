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
      appBar: PreferredSize(
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
              Container(
                width: double.infinity,
                height: 120,
                child: Image(
                  image: AssetImage('images/Logo/airlogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    'Flight',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              ChooseAir(),
              SizedBox(height: 10),
              SelectTripAir(),
              SizedBox(height: 20),
              Text(
                'Where do you want to go today?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Container(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10),
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
              ),
              SizedBox(height: 20),
              HomeMain(),
            ],
          ),
        ],
      ),
    );
  }
}
