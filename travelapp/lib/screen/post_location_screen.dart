import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/models/data_location.dart';
import 'package:travelapp/widget/PostWidget/post_app_bar.dart';
import 'package:travelapp/widget/PostWidget/post_button.dart';

// ignore: must_be_immutable
class PostScreen extends StatelessWidget {
  Location item;
  PostScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.8,
        child: Image.network(
          item.image[1],
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(),
        ),
        bottomNavigationBar: PostBottomBar(
          item: item,
        ),
      ),
    ]);
  }
}
