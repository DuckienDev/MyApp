import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/widget/HomeWidget/home_appbar_seach.dart';

class MapScreenn extends StatelessWidget {
  const MapScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Row(
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
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'images/Logo/ggmapImg.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
