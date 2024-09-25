import 'package:admin_shop_nike/models/shoes.dart';
import 'package:admin_shop_nike/sevices/cloud_firestore.dart';
import 'package:admin_shop_nike/widgets/my_product.dart';
import 'package:flutter/material.dart';

class ReadProducts extends StatefulWidget {
  const ReadProducts({super.key});

  @override
  State<ReadProducts> createState() => _ReadProductsState();
}

class _ReadProductsState extends State<ReadProducts> {
  final CloudFirestore _cloudFirestore = CloudFirestore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ALL PRODUCTS',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Shoe>>(
        future: _cloudFirestore.readShoe(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(child: CircularProgressIndicator(color: Colors.black));
          } else if (snapshot.hasError) {
            Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            const Center(child: Text('No products'));
          } else {
            List<Shoe> shoesList = snapshot.data!;
            return ListView.builder(
              itemCount: shoesList.length,
              itemBuilder: (context, index) {
                Shoe shoe = shoesList[index];
                return MyProduct(
                  img: shoe.imgShoes.img1,
                  name: shoe.names,
                  price: shoe.price.toString(),
                  status: shoe.status,
                );
              },
            );
          }
          return const Center(
              child: CircularProgressIndicator(color: Colors.black));
        },
      ),
    );
  }
}
