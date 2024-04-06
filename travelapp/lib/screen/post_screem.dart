import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/widget/Post_widget/post_image_city.dart';
import 'package:travelapp/widget/Post_widget/post_app_bar.dart';
import 'package:travelapp/widget/Post_widget/post_bottom.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.5,
          child: ImageCity()),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: PostAppBar(),
        ),
        bottomNavigationBar: PostBottomBar(),
      ),
    ]);
  }
}
