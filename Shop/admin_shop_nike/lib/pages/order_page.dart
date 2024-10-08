import 'package:admin_shop_nike/models/orders_information.dart';
import 'package:admin_shop_nike/sevices/cloud_firestore.dart';
import 'package:admin_shop_nike/widgets/my_button.dart';
import 'package:admin_shop_nike/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<OdersInformation> _orders = [];
  bool _isLoading = true;
  final CloudFirestore _firebase = CloudFirestore();

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    try {
      List<OdersInformation> orders =
          (await _firebase.getAllOrders()).cast<OdersInformation>();

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
        title: const Text(
          "ORDERS",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
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
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(' Infomation',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Text('Name : ${order.nameUser}'),
                                Text('Phone : ${order.phoneNumber}'),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    'Add Ress : ${order.addRess}',
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 130,
                              width: 1,
                              color: Colors.black,
                            ),
                            //PAY
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Pay',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                    'Shipping Costn : ${order.shippingCostn} USD'),
                                Text('Pre-Product : ${order.price} USD'),
                                Text('Total Payment : ${order.totalAmount} USD',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700)),
                                Row(
                                  children: [
                                    const Text('Status :',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700)),
                                    Text(
                                      ' ${order.orderStatus}',
                                      style: const TextStyle(
                                          fontSize: 13,
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
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Product',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
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
                              ),
                              subtitle: Text(
                                'Price : ${item['price']} USD',
                              ),
                              trailing: Text(
                                'Size :  ${item['size']} ',
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyButton(
                                  text: 'UPDATE STATE',
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        TextEditingController stateController =
                                            TextEditingController();

                                        return AlertDialog(
                                          title:
                                              const Text('UPDATE STATE ORDER'),
                                          content: MyTextField(
                                            controller: stateController,
                                            hintText: 'State',
                                          ),
                                          actions: [
                                            MyButton(
                                              text: 'Update',
                                              onTap: () async {
                                                String newState =
                                                    stateController.text;
                                                try {
                                                  await _firebase
                                                      .updateStateOrder(
                                                          order.id, newState);
                                                  Navigator.pop(context);

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Update state succfully')));
                                                  setState(() {});
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Error updating order: $e')));
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }),
                              MyButton(text: 'DELETE', onTap: () {})
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
