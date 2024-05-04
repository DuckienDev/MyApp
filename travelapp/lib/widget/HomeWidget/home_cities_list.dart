import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/apps/router/router_name.dart';
import 'package:travelapp/mockup/location_mockup.dart';

class HomeMain extends StatelessWidget {
  HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataLocation.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.goNamed(RouterName.postlocation,
                      extra: dataLocation[index]);
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    width: double.infinity,
                    dataLocation[index].image[1],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      dataLocation[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                  Text(
                    dataLocation[index].star,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
