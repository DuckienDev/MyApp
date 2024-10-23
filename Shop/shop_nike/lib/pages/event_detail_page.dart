import 'package:flutter/material.dart';
import 'package:shop_nike/models/event.dart';

class EventDetailPage extends StatefulWidget {
  Event event;

  EventDetailPage({
    super.key,
    required this.event,
  });

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 50,
          child: Image.asset('assets/img/Nike-logo-png-white.png'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //IMG EVENT
            Container(
              margin: const EdgeInsets.all(10),
              height: 500,
              width: double.infinity,
              child: Hero(
                tag: widget.event.title,
                child: Image.network(
                  widget.event.imgEvent,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //TITLE EVENT
            Text(
              widget.event.title,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            //DATE EVENT
            Text(
              widget.event.date,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            //DECRIPTION EVENT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "      ${widget.event.detailEvent}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 50, 50, 50),
                  letterSpacing: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
