import 'package:flutter/material.dart';
import 'package:travelapp/mockup/location_mockup.dart';

class HomeFavoriteCities extends StatelessWidget {
  const HomeFavoriteCities({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            child: ListView.builder(
              itemCount: dataLocation.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 160,
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(dataLocation[index].image[0]),
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
                            dataLocation[index].name,
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
