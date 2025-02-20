import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/oders_information.dart';
import '../models/profile.dart';
import '../sevices/auth/auth_sevices.dart';
import '../sevices/firestore/cloud_firestore.dart';
import '../sevices/provider.dart';
import '../sevices/stripe/stripe_api.dart';
import '../widgets/confirm_oder.dart';
import '../widgets/my_button.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    AuthSevices auth = AuthSevices();
    final cart = context.watch<Cart>();

    CloudFirestoreService firebase = CloudFirestoreService();

    //CHECK DELETE TASK
    Future<dynamic> checkDeleteTask(BuildContext context, String id) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            "Do you want to delete?",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () async {
                context.read<Cart>().removeItem(id);
                setState(() {});
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                color: Colors.red,
              ),
            ),
          ],
        ),
      );
    }

    // PAYMENT PROCESSING FUNCTION
    void handlePayment(Cart cart) async {
      Profile? userProfile =
          await firebase.getUser(auth.currentUser().toString());
      if (userProfile == null) {
        print('User profile not found');
        return;
      }

      var orderDocRef = FirebaseFirestore.instance
          .collection('user')
          .doc(auth.currentUser().toString())
          .collection('myOders')
          .doc();

      try {
        String orderId = orderDocRef.id;
        List<Map<String, dynamic>> items = cart.itemList;
        int shippingCost = 20;
        int price = cart.totalAmount;
        int totalAmount = price + shippingCost;
        String orderStatus = 'pending';

        if (items.isEmpty) {
          print('No items in cart to process.');
          return;
        }

        OdersInformation newOrder = OdersInformation(
          id: orderId,
          shippingCostn: shippingCost,
          price: price,
          totalAmount: totalAmount,
          orderStatus: orderStatus,
          itemList: items,
          nameUser: userProfile.name,
          phoneNumber: userProfile.phoneNumber,
          addRess: userProfile.addRess,
        );

        await firebase.addMyOrder(newOrder, auth.currentUser().toString());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Order placed successfully!'),
            backgroundColor: Colors.black,
          ),
        );
        cart.clearCart();
        setState(() {});
      } catch (e) {
        print('Error: ADD ORDER');
        print(e);
        // Thông báo lỗi
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to place order: $e'),
            backgroundColor: Colors.black,
          ),
        );
      }
    }

    //UI
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' C A R T ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          cart.items.isEmpty
              ? const Center(
                  child: Text(
                    'There are no products!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (ctx, i) {
                      final cartItem = cart.items.values.toList()[i];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              onLongPress: () async {
                                checkDeleteTask(context, cartItem.id);
                              },
                              leading: SizedBox(
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    cartItem.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                cartItem.name,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              subtitle: Text(
                                'Size: ${cartItem.size}',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              trailing: Text(
                                '${cartItem.price} USD',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: MyButton(
                  name: 'Total: ${cart.totalAmount} USD',
                  colorButton: Colors.white,
                  colorText: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    if (cart.items.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your cart is empty!'),
                          backgroundColor: Colors.black,
                        ),
                      );
                      return;
                    }

                    bool? isConfirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => const ConfirmOder(),
                    );

                    if (isConfirmed == true) {
                      bool paymentSuccess =
                          await StripeService.instance.makePayment(
                        AuthSevices().emailUser().toString(),
                        cart.totalAmount,
                      );

                      if (paymentSuccess) {
                        handlePayment(cart);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Payment failed!'),
                            backgroundColor: Colors.black,
                          ),
                        );
                      }
                    }
                  },
                  child: MyButton(name: 'PAY'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
