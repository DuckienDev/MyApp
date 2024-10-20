import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_nike/models/shoes.dart';
import 'package:shop_nike/pages/information_product.dart';
import 'package:shop_nike/pages/search_page.dart';
import 'package:shop_nike/sevices/cloud_firestore.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: SizedBox(
          width: 50,
          child: Image.asset('assets/img/Nike-logo-png-white.png'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),

      body: FutureBuilder(
        future: cloudFirestoreService.getShoes(),
        builder: (context, snapshot) {
          ///LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(child: CircularProgressIndicator(color: Colors.black));

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
                //CATERGORY
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'New & Future',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Men',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
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
                ),
                const SizedBox(height: 5),
                //EVENNT
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://people.com/thmb/3oZo78CMAZkNlASTl9NZoyFP35M=/4000x0/filters:no_upscale():max_bytes(150000):strip_icc():focal(749x0:751x2)/nike-1-b63456412dd94d12b3e4d6e0a24d9747.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'EXTRA - ORDINARY',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Meet the latest collection of retro running inspieds.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InformationProduct(shoe: shoe),
                          ),
                        );
                      },
                      child: MyProducts(shoe: shoe),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        },
      ),
    );
  }
}
