import 'package:admin_shop_nike/pages/add_products.dart';
import 'package:admin_shop_nike/pages/order_page.dart';
import 'package:admin_shop_nike/pages/read_products.dart';
import 'package:admin_shop_nike/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADMIN SHOP NIKE',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              text: 'ADD PRODUCTS',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProducts()));
              },
            ),
            const SizedBox(height: 10),
            MyButton(
              text: 'ALL PRODUCTS',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReadProducts()));
              },
            ),
            const SizedBox(height: 10),
            MyButton(
                text: 'ORDERS',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderPage()));
                }),
            const SizedBox(height: 10),
            MyButton(text: 'SUPPORT', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
