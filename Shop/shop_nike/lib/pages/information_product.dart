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
            //ADD TO CART
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                String selectedSize = 'EU 40';
                context.read<Cart>().addItem(
                      widget.shoe.id,
                      widget.shoe.names,
                      widget.shoe.imgShoes.img1,
                      widget.shoe.price,
                      selectedSize,
                      DateTime.now().toString(),
                    );
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text("Add products successfully.")));
              },
              child: MyButton(name: 'Add To Cart'),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
