import 'package:flutter/material.dart';
import 'package:shop_nike/models/oders_information.dart';
import 'package:shop_nike/sevices/auth_sevices.dart';
import 'package:shop_nike/sevices/cloud_firestore.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<OdersInformation> _orders = [];
  bool _isLoading = true;
  CloudFirestoreService _firebase = CloudFirestoreService();
  AuthSevices _auth = AuthSevices();

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    try {
      List<OdersInformation> orders =
          await _firebase.getOrders(_auth.currentUser().toString());
      setState(() {
        _orders = orders;
        _isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'O R D E R',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _isLoading
          //LOADING ODERS
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : _orders.isEmpty
              //ODER NOT DATA
              ? const Center(child: Text("No orders found"))
              //RETURN ODER
              : ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    OdersInformation order = _orders[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //ID
                        Center(
                          child: Text(
                            'ID : ${order.id}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(height: 15),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //INFORMATION USER
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Your Infomation',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                Text('Name : ${order.nameUser}'),
                                Text('Phone : ${order.phoneNumber}'),
                                Text('Add Ress : ${order.addRess}'),
                              ],
                            ),
                            Container(
                              height: 130,
                              width: 2,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            //PAY
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Pay',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                Text(
                                    'Shipping Costn : ${order.shippingCostn} USD'),
                                Text('Pre-Product : ${order.price} USD'),
                                Text('Total Payment : ${order.totalAmount} USD',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700)),
                                Row(
                                  children: [
                                    const Text('Status :',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      ' ${order.orderStatus}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.amber),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        // PRODUCT
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Product',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        ...order.itemList.map<Widget>(
                          (item) {
                            return ListTile(
                              leading: SizedBox(
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    item['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                item['name'],
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              subtitle: Text(
                                'Price : ${item['price']} USD',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              trailing: Text(
                                'Size :  ${item['size']} ',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            );
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Divider(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
