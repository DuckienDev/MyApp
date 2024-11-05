import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/models/shoes.dart';
import 'package:shop_nike/navigators/event_bar.dart';
import 'package:shop_nike/pages/information_product.dart';
import 'package:shop_nike/pages/search_page.dart';
import 'package:shop_nike/sevices/firestore/cloud_firestore.dart';
import 'package:shop_nike/widgets/event_home.dart';
import 'package:shop_nike/widgets/my_product.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> activeIndex = ValueNotifier<int>(0);
    final CloudFirestoreService cloudFirestoreService = CloudFirestoreService();

    @override
    void dispose() {
      activeIndex.dispose();
      super.dispose();
    }

    //UI
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        title: SizedBox(
          width: 50,
          child: Image.asset('assets/img/Nike-logo-png-white.png'),
        ),
        centerTitle: true,
        actions: [
          //Button Search
          OpenContainer(
            closedColor: Colors.black,
            openColor: Colors.black,
            closedShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(100.0))),
            transitionDuration: const Duration(milliseconds: 500),
            closedBuilder: (context, openContainer) => ClipOval(
              child: Material(
                color: Colors.black,
                child: InkWell(
                  onTap: openContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            openBuilder: (context, openContainer) => const SearchPage(),
          ),
        ],
      ),

      body: FutureBuilder(
        future: cloudFirestoreService.getShoes(),
        builder: (context, snapshot) {
          ///LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Colors.black,
                size: 40,
              ),
            );

            ///ERROR
          } else if (snapshot.hasError) {
            Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(fontSize: 17, color: Colors.black),
            ));

            ///NO PRODUCT
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            const Center(
                child: Text(
              'No products',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ));
          } else {
            List<Shoe> shoesList = snapshot.data!;
            final List<String> imgList =
                shoesList.map((e) => e.imgShoes.img1).cast<String>().toList();
            return ListView(
              children: [
                const SizedBox(height: 5),
                //EVENT BAR
                const EvenBarNavigator(),
                const SizedBox(height: 5),
                //EVENNT
                const EventHome(),
                const SizedBox(height: 20),
                //TEXT TRENDING
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Trending This Week',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                //SLIDER PRODUCT
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                    onPageChanged: (index, reason) {
                      activeIndex.value = index;
                    },
                  ),
                  items: imgList
                      .map((e) => Container(
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(e),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 10),
                //ANIMATION SMOOTH INDICATION
                ValueListenableBuilder<int>(
                  valueListenable: activeIndex,
                  builder: (context, value, child) {
                    return Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: value,
                        count: imgList.length,
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
                //TEXT TRENDING
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'New Product',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                //LIST PRODUCT
                GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: shoesList.length,
                  itemBuilder: (context, index) {
                    Shoe shoe = shoesList[index];
                    return OpenContainer(
                        transitionDuration: const Duration(milliseconds: 500),
                        closedBuilder: (context, openContainer) =>
                            MyProducts(shoe: shoe),
                        openBuilder: (context, openContainer) =>
                            InformationProduct(shoe: shoe),
                        closedShape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(12)));
                  },
                ),
              ],
            );
          }
          return Center(
            child: LoadingAnimationWidget.dotsTriangle(
              color: Colors.black,
              size: 40,
            ),
          );
        },
      ),
    );
  }
}
