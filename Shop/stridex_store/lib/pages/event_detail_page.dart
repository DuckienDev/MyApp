import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:typewritertext/typewritertext.dart';

import '../models/event.dart';

// ignore: must_be_immutable
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
          width: 80,
          child: Image.asset(
              'assets/img/04CA58E5-00BD-46E4-8BB7-65FC88BD7962.PNG'),
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
            Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: const Color.fromARGB(255, 253, 248, 209),
              child: Text(
                widget.event.title,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CollegiateFLF',
                ),
                textAlign: TextAlign.center,
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
              child: TypeWriter.text(
                widget.event.detailEvent,
                duration: const Duration(milliseconds: 10),
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
