import 'package:flutter/material.dart';

import '../../widgets/sport_ment_event.dart';
import '../../widgets/title_men_event.dart';
import '../../widgets/trending_men_event.dart';

class WomenEventPage extends StatefulWidget {
  const WomenEventPage({super.key});

  @override
  State<WomenEventPage> createState() => _WomenEventPageState();
}

class _WomenEventPageState extends State<WomenEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Women"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleMenEvent(
              image: "assets/img/pic1.png",
              title: "YOU CAN'T WIN. SO WIN.",
            ),
            const SizedBox(height: 15),
            const TrendingMenEvent(),
            const SizedBox(height: 15),
            const SportMentEvent(),
          ],
        ),
      ),
    );
  }
}
