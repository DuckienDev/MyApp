import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/mockup/location_mockup.dart';
import 'package:travelapp/models/data_location.dart';
import 'package:travelapp/provider/like_provider.dart';
import 'package:travelapp/widget/HomeWidget/home_appbar_seach.dart';

class FavorieScreen extends StatelessWidget {
  FavorieScreen({super.key, required Location item});

  @override
  Widget build(BuildContext context) {
    List<int> idListLike = context.watch<LikeProviderLct>().listLikeLct;
    List<Location> data = dataLocation
        .where((element) => idListLike.contains(element.id))
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              HomeBar(),
            ],
          ),
        ),
      ),
      body: data.isNotEmpty
          ? ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(blurRadius: 2),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(data[index].image[1]),
                        fit: BoxFit.cover,
                        opacity: 0.8,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        data[index].name,
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(child: Text('Not Location Like')),
    );
  }
}
