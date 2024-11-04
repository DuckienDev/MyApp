import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_nike/models/shoes.dart';

class MyProducts extends StatelessWidget {
  const MyProducts({
    super.key,
    required this.shoe,
  });

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //IMAGE PRODUCT
        SizedBox(
          height: 120,
          width: 500,
          child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 500)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                );
              } else {
                return Image.network(
                  shoe.imgShoes.img1,
                  fit: BoxFit.cover,
                );
              }
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TITLE PRODUCT
              Text(
                shoe.brand,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
              //NAME PRODUCT
              Text(
                shoe.names,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              //PRICE PRODUCT
              Text(
                '${shoe.price} USD',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
