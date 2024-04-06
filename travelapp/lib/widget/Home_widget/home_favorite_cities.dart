import 'package:flutter/material.dart';

class HomeFavoriteCities extends StatefulWidget {
  const HomeFavoriteCities({
    super.key,
  });

  @override
  State<HomeFavoriteCities> createState() => _HomeFavoriteCitiesState();
}

class _HomeFavoriteCitiesState extends State<HomeFavoriteCities> {
  var nameCities = [
    'Switzerland',
    'Italy',
    'United States',
    'Singapore',
    'England',
    'Japan',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 160,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 15),
                    // color: Colors.black,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("images/cities/city${index + 1}.jpg"),
                        fit: BoxFit.cover,
                        opacity: 0.8,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.bookmark_border_outlined,
                              color: Colors.white,
                              size: 30,
                              shadows: [BoxShadow(color: Colors.yellow)],
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            nameCities[index++],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
