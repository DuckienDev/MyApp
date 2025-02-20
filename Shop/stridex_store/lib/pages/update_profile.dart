import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../sevices/firestore/cloud_firestore.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_field.dart';


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
    final CloudFirestoreService firestore = CloudFirestoreService();

    final TextEditingController nameController = TextEditingController();
    final TextEditingController dateOfbirthController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addRessController = TextEditingController();
    //UPDATE USER INFORMATION
    userUpdate() async {
      if (nameController.text.isEmpty ||
          addRessController.text.isEmpty ||
          phoneController.text.isEmpty ||
          dateOfbirthController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill in all information.")),
        );
        return;
      } else {
        try {
          await firestore.userUpDate(
            Profile(
              id: widget._profile!.id,
              name: nameController.text,
              dateOfBirth: dateOfbirthController.text,
              phoneNumber: phoneController.text,
              email: widget._profile!.email,
              addRess: addRessController.text,
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
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ),
          MyTextField(
            controller: nameController,
            labelText: 'Full Name',
            obscureText: false,
          ),
          MyTextField(
            controller: dateOfbirthController,
            labelText: 'Date Of Brith',
            obscureText: false,
          ),
          MyTextField(
            controller: phoneController,
            labelText: 'Phone Number ',
            obscureText: false,
          ),
          MyTextField(
            controller: addRessController,
            labelText: 'Add Ress',
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
