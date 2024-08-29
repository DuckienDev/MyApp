import 'package:flutter/material.dart';
import 'package:shop_nike/models/shoes.dart';
import 'package:shop_nike/sevices/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CloudFirestoreService _cloudFirestoreService =
        CloudFirestoreService();
    late Future<List<Shoes>> _shoes;
    setState(() {
      _shoes = _cloudFirestoreService.getShoes();
    });
    //UI
    return Scaffold(
      //APP BAR
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(   
          'N I K E.',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _shoes,
        builder: (context, snapsot) {
          //LOADING
          if (snapsot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //ERROR
          else if (snapsot.hasError) {
            return const Center(child: Text('something went wrong !'));
          } else if (!snapsot.hasData == snapsot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            List<Shoes> shoes = snapsot.data!;
            return ListView.builder(
              itemCount: shoes.length,
              itemBuilder: (context, index) {
                return Text(shoes.toString());
              },
            );
          }
        },
      ),
    );
  }
}
