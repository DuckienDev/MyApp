import 'package:flutter/material.dart';
import 'package:shop_nike/models/profile.dart';
import 'package:shop_nike/sevices/cloud_firestore.dart';
import 'package:shop_nike/widgets/my_button.dart';
import 'package:shop_nike/widgets/my_text_field.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({
    super.key,
    required Profile? profile,
  }) : _profile = profile;
  final Profile? _profile;
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    final CloudFirestoreService _firestore = CloudFirestoreService();

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _dateOfbirthController =
        TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _addRessController = TextEditingController();
    //UPDATE USER INFORMATION
    userUpdate() async {
      if (_nameController.text.isEmpty ||
          _addRessController.text.isEmpty ||
          _phoneController.text.isEmpty ||
          _dateOfbirthController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all information.")),
        );
        return;
      } else {
        try {
          await _firestore.userUpDate(
            Profile(
              id: widget._profile!.id,
              name: _nameController.text,
              dateOfBirth: _dateOfbirthController.text,
              phoneNumber: _phoneController.text,
              email: widget._profile!.email,
              addRess: _addRessController.text,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Update Successfully.")),
          );
          Navigator.pop(context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Update failed: $e")),
          );
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'U P D A T E   P O R F I L E',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Please fill in all information !',
              ),
            ),
          ),
          MyTextField(
            controller: _nameController,
            hintText: 'Full Name',
            obscureText: false,
          ),
          MyTextField(
            controller: _dateOfbirthController,
            hintText: 'Date Of Brith',
            obscureText: false,
          ),
          MyTextField(
            controller: _phoneController,
            hintText: 'Phone Number ',
            obscureText: false,
          ),
          MyTextField(
            controller: _addRessController,
            hintText: 'Add Ress',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              userUpdate();
            },
            child: MyButton(name: 'Save'),
          ),
        ],
      ),
    );
  }
}
