import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/models/event.dart';
import 'package:shop_nike/pages/event_detail_page.dart';
import 'package:shop_nike/sevices/cloud_firestore.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

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
        title: const Text("New & Future"),
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
                          child: Image.network(
                            e.imgEvent,
                            fit: BoxFit.cover,
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
