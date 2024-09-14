import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageProductList extends StatelessWidget {
  const ImageProductList({
    super.key,
    required this.activeIndexInf,
    required this.ListImg,
  });

  final ValueNotifier<int> activeIndexInf;
  final List<String> ListImg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 2,
              onPageChanged: (index, reason) {
                activeIndexInf.value = index;
              },
            ),
            items: ListImg.map((e) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                )).toList(),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<int>(
            valueListenable: activeIndexInf,
            builder: (context, value, child) {
              return Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: value,
                  count: ListImg.length,
                  effect: const ScrollingDotsEffect(
                    activeDotColor: Colors.black,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
