import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTickets extends StatelessWidget {
  const AppBarTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Round-Trip'),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Price'),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Rank'),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 20,
                        ),
                        SizedBox(width: 2),
                        Text('1'),
                        SizedBox(width: 2),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: EdgeInsets.all(5),
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
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 10),
                        Text('Start            '),
                      ],
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 10),
                        Text('Destination'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
