import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/models/data_location.dart';
import 'package:travelapp/widget/PostWidget/post_app_bar.dart';
import 'package:travelapp/widget/PostWidget/post_button.dart';

// ignore: must_be_immutable
class PostScreen extends StatelessWidget {
  final _controller = PageController();
  Location item;
  PostScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                child: Image.network(
                  item.image[1],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Image.network(
                  item.image[0],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                child: Image.network(
                  item.image[2],
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          PostAppBar(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: item.image.length,
                  effect: SwapEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white,
                    dotHeight: 15,
                    dotWidth: 15,
                  ),
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ],
      ),
      bottomNavigationBar: PostBottomBar(item: item),
    );
  }
}
