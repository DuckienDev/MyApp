import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelapp/apps/router/router_name.dart';
import 'package:travelapp/models/data_location.dart';
import 'package:travelapp/provider/like_provider.dart';
import 'package:travelapp/widget/PostWidget/post_button.dart';

class PostScreen extends StatelessWidget {
  Location item;
  PostScreen({super.key, required this.item});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                Container(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context.goNamed(RouterName.homepage);
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 3,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Icon(Icons.arrow_back_ios_new, size: 20),
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 3,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Consumer<LikeProviderLct>(
                              builder: (context, value, child) => LikeButton(
                                isLiked: value.listLikeLct.contains(item.id),
                                onTap: (like) {
                                  context
                                      .read<LikeProviderLct>()
                                      .onLike(item.id);
                                  return Future.value(!like);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.zero,
              child: PostBottomBar(item: item),
            ),
          ),
        ],
      ),
    );
  }
}
