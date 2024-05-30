import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketPaymentScreen extends StatefulWidget {
  const TicketPaymentScreen({super.key});

  @override
  State<TicketPaymentScreen> createState() => _TicketPaymentScreenState();
}

class _TicketPaymentScreenState extends State<TicketPaymentScreen> {
  int _type = 1;

  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '         PAYMENT METHOD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: _type == 1
                    ? Border.all(width: 2, color: Colors.red)
                    : Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _type,
                        onChanged: _handleRadio,
                        activeColor: Colors.red,
                      ),
                      Text(
                        'Apple Pay',
                        style: _type == 1
                            ? const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)
                            : const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      height: 35,
                      child: Image.network(
                        'https://1000logos.net/wp-content/uploads/2023/03/Apple-Pay-logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: _type == 4
                    ? Border.all(width: 2, color: Colors.red)
                    : Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: _type,
                        onChanged: _handleRadio,
                        activeColor: Colors.red,
                      ),
                      Text(
                        'Google Pay',
                        style: _type == 4
                            ? const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)
                            : const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      height: 75,
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/017/221/782/non_2x/google-pay-logo-transparent-free-png.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: _type == 2
                    ? Border.all(width: 2, color: Colors.red)
                    : Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _type,
                        onChanged: _handleRadio,
                        activeColor: Colors.red,
                      ),
                      Text(
                        'Credit Card',
                        style: _type == 2
                            ? const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)
                            : const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      height: 30,
                      child: Image.network(
                        'https://th.bing.com/th/id/OIP.LMwzmOS4wFNhM1w_8S4THgHaEK?rs=1&pid=ImgDetMain',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: _type == 3
                    ? Border.all(width: 2, color: Colors.red)
                    : Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: _type,
                        onChanged: _handleRadio,
                        activeColor: Colors.red,
                      ),
                      Text(
                        'Paypal',
                        style: _type == 3
                            ? const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black)
                            : const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SizedBox(
                      height: 45,
                      child: Image.network(
                        'https://th.bing.com/th/id/OIP.Y4Rus6kN07qK6XnhmjXPngAAAA?rs=1&pid=ImgDetMain',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: _type == 5
                    ? Border.all(width: 2, color: Colors.red)
                    : Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 5,
                    groupValue: _type,
                    onChanged: _handleRadio,
                    activeColor: Colors.red,
                  ),
                  Text(
                    '...',
                    style: _type == 5
                        ? const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)
                        : const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub - Total :',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "\$500.00",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Other costs (*) :',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "\$20.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payment :',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                      Text(
                        "\$520.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Confirm Payment',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
