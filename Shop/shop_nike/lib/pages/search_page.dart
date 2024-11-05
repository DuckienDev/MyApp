import 'package:flutter/material.dart';
import 'package:shop_nike/models/shoes.dart';
import 'package:shop_nike/pages/information_product.dart';
import 'package:shop_nike/sevices/firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final CloudFirestoreService _cloudFirestoreService = CloudFirestoreService();
  List<Shoe> _results = [];
  final TextEditingController _searchController = TextEditingController();

  void performSearch(String searchTerm) async {
    if (searchTerm.isEmpty) {
      setState(() {
        _results = [];
      });
      return;
    }
    List<Shoe> searchResults =
        await _cloudFirestoreService.searchByName(searchTerm);
    setState(() {
      _results = searchResults;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 50,
          child: Image.asset('assets/img/Nike-logo-png-white.png'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: performSearch,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: InputBorder.none,
                hintText: ' Search...',
                hintStyle: Theme.of(context).textTheme.displayMedium,
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: _results.isNotEmpty
                ? ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      var shoe = _results[index];
                      return ListTile(
                        leading: SizedBox(
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              shoe.imgShoes.img1,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(shoe.names,
                            style: const TextStyle(
                              color: Colors.black,
                            )),
                        subtitle: Text(
                          '${shoe.price} USD',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  InformationProduct(shoe: shoe),
                            ),
                          );
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'Please enter keywords to search.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
