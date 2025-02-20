import 'package:flutter/material.dart';
import 'package:stridex_store/widgets/my_button.dart';

import '../models/profile.dart';
import '../pages/order_page.dart';
import '../pages/update_profile.dart';
import '../sevices/auth/auth_sevices.dart';


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
        const SizedBox(height: 80),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OderPage()));
                    },
                    child: MyButton(
                      name: 'Transporting',
                      colorButton: Colors.white,
                      colorText: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: MyButton(
                      name: 'History',
                      colorButton: Colors.white,
                      colorText: Colors.black,
                    )),
              ],
            ),
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
