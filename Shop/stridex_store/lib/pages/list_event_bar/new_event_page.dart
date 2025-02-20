import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../../models/event.dart';
import '../../sevices/firestore/cloud_firestore.dart';
import '../event_detail_page.dart';

class NewEventPage extends StatefulWidget {
  const NewEventPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewEventPageState createState() => _NewEventPageState();
}

class _NewEventPageState extends State<NewEventPage> {
  final CloudFirestoreService _firestore = CloudFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New & Future",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Event>>(
        future: _firestore.eventData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Colors.black,
                size: 40,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No events available.'));
          } else {
            List<Event> events = snapshot.data!;

            return VerticalCardPager(
              titles: events.map((e) => e.titles.toUpperCase()).toList(),
              images: events
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Hero(
                          tag: e.title,
                          child: FutureBuilder(
                            future: Future.delayed(
                                const Duration(milliseconds: 500)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              } else {
                                return Image.network(
                                  e.imgEvent,
                                  fit: BoxFit.cover,
                                );
                              }
                            },
                          ),
                        ),
                      ))
                  .toList(),
              onPageChanged: (page) {},
              onSelectedItem: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetailPage(event: events[index]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
