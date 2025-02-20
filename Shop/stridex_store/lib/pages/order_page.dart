import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../models/oders_information.dart';
import '../sevices/auth/auth_sevices.dart';
import '../sevices/firestore/cloud_firestore.dart';

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

  String? _selectedStatus = "All";
  final List<String> _statusList = [
    "All",
    "Pending",
    "Shipped",
    "Delivered",
    "Cancelled"
  ];

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders({String? status}) async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<OdersInformation> orders = await _firebase
          .getOrders(_auth.currentUser().toString(), status: status);
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filter by Status:",
                    style: Theme.of(context).textTheme.displayMedium),
                SizedBox(
                  width: 100,
                  child: DropdownButton<String>(
                    value: _selectedStatus,
                    style: Theme.of(context).textTheme.displayMedium,
                    hint: Text(
                      "Filter by Status",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    isExpanded: true,
                    items: _statusList.map((status) {
                      return DropdownMenuItem(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                      _fetchOrders(status: value == "All" ? null : value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                      color: Colors.black,
                      size: 40,
                    ),
                  )
                : _orders.isEmpty
                    ? const Center(
                        child: Text(
                          "No orders found",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _orders.length,
                        itemBuilder: (context, index) {
                          OdersInformation order = _orders[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            'Your Information',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ),
                                        Text('Name : ${order.nameUser}'),
                                        Text('Phone : ${order.phoneNumber}'),
                                        Text('Address : ${order.addRess}'),
                                      ],
                                    ),
                                    Container(
                                      height: 130,
                                      width: 2,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            'Shipping Cost: ${order.shippingCostn} USD'),
                                        Text('Pre-Product: ${order.price} USD'),
                                        Text(
                                            'Total Payment: ${order.totalAmount} USD'),
                                        Row(
                                          children: [
                                            const Text('Status :',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700)),
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
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Divider(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
