import 'package:flutter/material.dart';

import '../../widgets/sport_ment_event.dart';
import '../../widgets/title_men_event.dart';
import '../../widgets/trending_men_event.dart';

class MenEventPage extends StatefulWidget {
  const MenEventPage({super.key});

  @override
  State<MenEventPage> createState() => _MenEventPageState();
}

class _MenEventPageState extends State<MenEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Men"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleMenEvent(
              image: "assets/img/pic2.png",
              title: "TAILORED FOR \nALL-DAY COMFORT",
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
