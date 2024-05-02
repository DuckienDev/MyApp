import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/apps/router/router_name.dart';
import 'package:travelapp/models/data_location.dart';
import 'package:travelapp/widget/HomeWidget/home_appbar_seach.dart';

// ignore: must_be_immutable
class FavorieScreen extends StatefulWidget {
  Location item;
  FavorieScreen({super.key, required this.item});

  @override
  State<FavorieScreen> createState() => _FavorieScreenState();
}

class _FavorieScreenState extends State<FavorieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    context.goNamed(RouterName.homepage);
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              HomeBar(),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(blurRadius: 2),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    'images/cities/city${index + 1}.jpg',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                ),
              ),
              child: Center(
                child: Text(
                  cities[index++],
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

var cities = [
  'Switzerland',
  'Italy',
  'United States',
  'Singapore',
  'England',
  'Japan',
];
