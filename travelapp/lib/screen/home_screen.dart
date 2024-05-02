import 'package:flutter/material.dart';
import 'package:travelapp/widget/HomeWidget/home_appbar_seach.dart';
import 'package:travelapp/widget/HomeWidget/home_cities_list.dart';
import 'package:travelapp/widget/HomeWidget/home_favorite_cities.dart';
import 'package:travelapp/widget/HomeWidget/home_information_bar.dart';
import 'package:travelapp/widget/HomeWidget/home_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeNavBar(),
      appBar: AppBar(
        title: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: HomeBar(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeFavoriteCities(),
                SizedBox(height: 20),
                InformationBar(),
                SizedBox(height: 10),
                HomeMain(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
