import 'package:flutter/material.dart';
import 'package:travelapp/mockup/ticket_mocup.dart';
import 'package:travelapp/screen/flight_inf_screen.dart';
import 'package:travelapp/widget/AirPlanceWidget/app_bar_ticket.dart';

class TicketSelection extends StatelessWidget {
  const TicketSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(175),
        child: Column(
          children: [
            AppBar(
              title: Center(
                child: const Text(
                  'TICKET SELECTION          ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              leading: const BackButton(),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
            AppBarTickets()
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dataTicket.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FlightInfScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black, blurRadius: 2),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        image: DecorationImage(
                          image: NetworkImage(dataTicket[index].logo),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Center(
                            child: Text(
                              dataTicket[index].airlines,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              'Time: ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(dataTicket[index].times),
                          ],
                        ),
                        Text(dataTicket[index].numberOfStop),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Text(
                              'Price: ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              dataTicket[index].price,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
