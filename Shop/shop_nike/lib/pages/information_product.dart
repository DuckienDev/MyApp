import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_nike/models/shoes.dart';
import 'package:shop_nike/sevices/provider.dart';
import 'package:shop_nike/widgets/detail_product.dart';
import 'package:shop_nike/widgets/img_product.dart';
import 'package:shop_nike/widgets/my_button.dart';

class InformationProduct extends StatefulWidget {
  final Shoe shoe;

  const InformationProduct({
    super.key,
    required this.shoe,
  });

  @override
  State<InformationProduct> createState() => _InformationProductState();
}

class _InformationProductState extends State<InformationProduct> {
  final List<int> shoeSizes = [38, 39, 40, 41, 42, 43, 44];
  int selectedSize = 0;

  late List<String> ListImg = [
    (widget.shoe.imgShoes.img3),
    (widget.shoe.imgShoes.img1),
    (widget.shoe.imgShoes.img2),
  ];
  final ValueNotifier<int> activeIndexInf = ValueNotifier<int>(0);

  @override
  void dispose() {
    activeIndexInf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 50,
          child: Image.asset('assets/img/Nike-logo-png-white.png'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //IMG PRODUCT
            ImageProductList(activeIndexInf: activeIndexInf, ListImg: ListImg),
            const SizedBox(height: 10),
            //INFORMATION PRODUCT
            MyIFMProduct(widget: widget),
            //SIZE
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SELECT SIZE ',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 140,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemCount: shoeSizes.length,
                      itemBuilder: (context, index) {
                        int size = shoeSizes[index];
                        bool isSelected = selectedSize == size;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: SizedBox(
                            height: 10,
                            width: 10,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.black
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color:
                                      isSelected ? Colors.black : Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              child: Text(
                                size.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),


            //ADD TO CART
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                context.read<Cart>().addItem(
                      widget.shoe.id,
                      widget.shoe.names,
                      widget.shoe.imgShoes.img1,
                      widget.shoe.price,
                      selectedSize.toString(),
                      DateTime.now().toString(),
                    );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text("Add products successfully.")));
              },
              child: MyButton(name: 'Add To Cart'),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
