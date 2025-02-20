import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/sport_event.dart';
import '../sevices/firestore/cloud_firestore.dart';

class SportMentEvent extends StatelessWidget {
  const SportMentEvent({
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
              "Shop By Sport",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        FutureBuilder(
          future: cloudFirestoreService.suportEventData(),
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
              List<SportEvent> sportEvent = snapshot.data!;
              return SizedBox(
                height: 310,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: sportEvent.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    SportEvent sport = sportEvent[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 180,
                                width: 250,
                                child: Image.network(
                                  sport.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 120,
                                left: 25,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 232, 224, 224),
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                  child: Text(
                                    sport.sport,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
