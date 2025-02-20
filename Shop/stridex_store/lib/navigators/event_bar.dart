import 'package:flutter/material.dart';

import '../pages/list_event_bar/men_event_page.dart';
import '../pages/list_event_bar/new_event_page.dart';
import '../pages/list_event_bar/women_event_page.dart';


class EvenBarNavigator extends StatelessWidget {
  const EvenBarNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewEventPage()));
            },
            child: Text(
              'New & Future',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MenEventPage()));
            },
            child: Text(
              'Men',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WomenEventPage()));
            },
            child: Text(
              'Women',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Kids',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Sale',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Customise',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
