import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/models/data_location.dart';

// ignore: must_be_immutable
class PostBottomBar extends StatefulWidget {
  Location item;
  PostBottomBar({super.key, required this.item});
  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 3),
                      Text(
                        widget.item.star,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                widget.item.description,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.item.image[0],
                          fit: BoxFit.cover,
                          width: 110,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          widget.item.image[1],
                          fit: BoxFit.cover,
                          width: 110,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(widget.item.image[2]),
                        opacity: 0.7,
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 110,
                    height: 80,
                    child: Text(
                      '+10',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 3,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Center(
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
