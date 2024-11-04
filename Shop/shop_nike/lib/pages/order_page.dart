import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/models/oders_information.dart';
import 'package:shop_nike/sevices/auth_sevices.dart';
import 'package:shop_nike/sevices/cloud_firestore.dart';

class OderPage extends StatefulWidget {
  const OderPage({super.key});

  @override
  State<OderPage> createState() => _OderPageState();
}

class _OderPageState extends State<OderPage> {
  List<OdersInformation> _orders = [];
  bool _isLoading = true;
  final CloudFirestoreService _firebase = CloudFirestoreService();
  final AuthSevices _auth = AuthSevices();

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
          ? Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Colors.black,
                size: 40,
              ),
            )
          : _orders.isEmpty
              //ODER NOT DATA
              ? const Center(
                  child: Text(
                    "No orders found",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                )
              //RETURN ODER
              : ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    OdersInformation order = _orders[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //ID
                          Center(
                            child: Text(
                              'ID : ${order.id}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
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
                                  Text(
                                    'Name : ${order.nameUser}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  Text(
                                    'Phone : ${order.phoneNumber}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  Text(
                                    'Add Ress : ${order.addRess}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
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
                                    'Shipping Costn : ${order.shippingCostn} USD',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Pre-Product : ${order.price} USD',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Total Payment : ${order.totalAmount} USD',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                  Row(
                                    children: [
                                      const Text('Status :',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
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
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                trailing: Text(
                                  'Size :  ${item['size']} ',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
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
                      ),
                    );
                  },
                ),
    );
  }
}
