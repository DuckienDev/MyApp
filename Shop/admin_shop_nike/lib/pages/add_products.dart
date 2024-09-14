import 'package:admin_shop_nike/models/shoes.dart';
import 'package:admin_shop_nike/sevices/cloud_firestore.dart';
import 'package:admin_shop_nike/widgets/my_button.dart';
import 'package:admin_shop_nike/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final CloudFirestore _cloudFirestore = CloudFirestore();

  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _img1Controller = TextEditingController();
  final TextEditingController _img2Controller = TextEditingController();
  final TextEditingController _img3Controller = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _sizedsController = TextEditingController();
  final TextEditingController _usesController = TextEditingController();
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _producerController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  Future<void> _addShoe() async {
    Shoe newShoe = Shoe(
      id: '',
      brand: _brandController.text,
      names: _nameController.text,
      imgShoes: imageShoes(
          img1: _img1Controller.text,
          img2: _img2Controller.text,
          img3: _img3Controller.text),
      price: int.tryParse(_priceController.text) ?? 0,
      sizeds: _sizedsController.text,
      details: detailShoes(
        uses: _usesController.text,
        material: _materialController.text,
        producer: _producerController.text,
      ),
      status: _statusController.text,
    );
    try {
      await _cloudFirestore.addShoe(newShoe);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Add products successfully.")));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error: ")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD PRODUCTS',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Please fill in the content completely!'),
              const SizedBox(height: 10),
              MyTextField(controller: _brandController, hintText: 'Brand'),
              const SizedBox(height: 10),
              MyTextField(controller: _nameController, hintText: 'Name'),
              const SizedBox(height: 10),
              MyTextField(controller: _img1Controller, hintText: 'Url Image 1'),
              const SizedBox(height: 10),
              MyTextField(controller: _img2Controller, hintText: 'Url Image 2'),
              const SizedBox(height: 10),
              MyTextField(controller: _img3Controller, hintText: 'Url Image 3'),
              const SizedBox(height: 10),
              MyTextField(controller: _priceController, hintText: 'Price'),
              const SizedBox(height: 10),
              MyTextField(controller: _sizedsController, hintText: 'Sized'),
              const SizedBox(height: 10),
              MyTextField(controller: _usesController, hintText: 'Uses'),
              const SizedBox(height: 10),
              MyTextField(
                  controller: _materialController, hintText: 'Material'),
              const SizedBox(height: 10),
              MyTextField(
                  controller: _producerController, hintText: 'Producer'),
              const SizedBox(height: 10),
              MyTextField(controller: _statusController, hintText: 'Status'),
              const SizedBox(height: 10),
              MyButton(
                text: 'ADD',
                onTap: () {
                  _addShoe();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
