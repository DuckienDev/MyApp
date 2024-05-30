import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/mockup/ticket_mocup.dart';
import 'package:travelapp/screen/card_screen.dart';

class FlightInfScreen extends StatefulWidget {
  const FlightInfScreen({super.key});

  @override
  State<FlightInfScreen> createState() => _FlightInfScreenState();
}

class _FlightInfScreenState extends State<FlightInfScreen> {
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
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: Column(
          children: [
            AppBar(
              title: Center(
                child: const Text(
                  'FLIGHT INFORMATION      ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              leading: const BackButton(),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'HA NOI',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(Icons.arrow_right_outlined),
                                Text(
                                  'SINGAPORE',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Round-Trip'),
                                Text('  |  '),
                                Text('Economy'),
                                Text('  |  '),
                                Text('1 People'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price: ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text('500 USD'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network(
                                  'https://i.pinimg.com/originals/7a/ec/17/7aec17946661a88378269d0b642b61f3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              dataTicket.first.airlines,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Flight Information',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Start',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('Thursday, 19/9/2024'),
                                Text(
                                  '23:00 - 12:10',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('HANOI - SINGAPOR'),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network(
                                  'https://i.pinimg.com/originals/7a/ec/17/7aec17946661a88378269d0b642b61f3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'End',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('Friday, 20/9/2024'),
                                Text(
                                  '23:00 - 12:10',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('SINGAPOR - HANOI'),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network(
                                  'https://i.pinimg.com/originals/7a/ec/17/7aec17946661a88378269d0b642b61f3.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 650,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Customer Information (1)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),

                      /// LAST NAME
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Last name in Latin *',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: InputBorder.none,
                            hintText: 'Last name',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //NAME
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Name in Latin *',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: InputBorder.none,
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //date of birth
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Date of birth *',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: InputBorder.none,
                            hintText: 'yyyy/mm/dd',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Email *',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //phone
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Phone Number *',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      //gender
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Gender *',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _type,
                                activeColor: Colors.red,
                                onChanged: _handleRadio,
                              ),
                              Text('Male'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _type,
                                activeColor: Colors.red,
                                onChanged: _handleRadio,
                              ),
                              Text('Famale'),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Choose a sitting position (1)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: SizedBox(
                          child: Image.asset('images/abc.jpng'),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Other services',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(),
                      Center(
                        child: SizedBox(
                          child: Image.asset('images/ABCD.png'),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TicketPaymentScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(blurRadius: 2, color: Colors.grey)
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
