import 'package:flutter/material.dart';
import 'package:shop_nike/models/profile.dart';
import 'package:shop_nike/pages/update_profile.dart';
import 'package:shop_nike/sevices/auth_sevices.dart';
import 'package:shop_nike/widgets/my_button.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
    required this.styleText,
    required Profile? profile,
    required AuthSevices auth,
  }) : _profile = profile;

  final TextStyle? styleText;
  final Profile? _profile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(100, 60),
                  bottomRight: Radius.elliptical(100, 60),
                ),
              ),
              width: double.infinity,
              height: 130,
            ),
            Positioned(
              top: 50,
              child: SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/user-profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 90),
        Column(
          children: [
            ListTile(
              leading: Text(
                'Full Name :',
                style: styleText,
              ),
              title: Text(
                _profile!.name,
                style: styleText,
              ),
            ),
            ListTile(
              leading: Text(
                'Date Of Birth :',
                style: styleText,
              ),
              title: Text(
                _profile.dateOfBirth,
                style: styleText,
              ),
            ),
            ListTile(
              leading: Text(
                'Phone Number :',
                style: styleText,
              ),
              title: Text(
                _profile.phoneNumber,
                style: styleText,
              ),
            ),
            ListTile(
              leading: Text(
                'Email :',
                style: styleText,
              ),
              title: Text(
                _profile.email,
                style: styleText,
              ),
            ),
            ListTile(
              leading: Text(
                'Address :',
                style: styleText,
              ),
              title: Text(
                _profile.addRess,
                style: styleText,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpdateProfile(profile: _profile)));
              },
              child: MyButton(
                name: 'Update Information',
              ),
            ),
          ],
        ),
      ],
    );
  }
}