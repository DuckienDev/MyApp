import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../models/shoes.dart';
import '../pages/information_product.dart';
import '../sevices/firestore/cloud_firestore.dart';

class TrendingMenEvent extends StatelessWidget {
  const TrendingMenEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CloudFirestoreService cloudFirestoreService = CloudFirestoreService();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          children: [
            SizedBox(width: 8),
            Text(
              "Trending This Week",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        FutureBuilder(
          future: cloudFirestoreService.getShoes(),
          builder: (context, snapshot) {
            ///LOADING
            if (snapshot.connectionState == ConnectionState.waiting) {
              Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: Colors.black,
                  size: 40,
                ),
              );

              ///ERROR
            } else if (snapshot.hasError) {
              Center(
                  child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ));

              ///NO PRODUCT
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              const Center(
                  child: Text(
                'No products',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ));
            } else {
              List<Shoe> shoesList = snapshot.data!;
              return SizedBox(
                height: 310,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: shoesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Shoe shoe = shoesList[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InformationProduct(shoe: shoe)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 250,
                              width: 200,
                              child: Image.network(
                                shoe.imgShoes.img1,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              shoe.brand,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              shoe.names,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "${shoe.price} USD",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        )
      ],
    );
  }
}
