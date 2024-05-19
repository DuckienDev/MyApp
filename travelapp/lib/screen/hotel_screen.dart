import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/mockup/hotel_mockup.dart';
import 'package:travelapp/widget/HomeWidget/home_appbar_seach.dart';
import 'package:travelapp/widget/HotelWidget/app_bar_hotel.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreen();
}

class _HotelScreen extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(175),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
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
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    const HomeBar(),
                  ],
                ),
                const AppBarRestaurant(),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: dataHotel.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 2),
                  ]),
              child: Row(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(dataHotel[index].image[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            dataHotel[index].star,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 3),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const Icon(Icons.star_border,
                              color: Colors.black, size: 17),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 150,
                        child: Center(
                          child: Text(
                            dataHotel[index].name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        dataHotel[index].price,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
