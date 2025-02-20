import 'package:flutter/material.dart';
import 'package:stridex_store/pages/welcom_page.dart';
import 'package:stridex_store/widgets/my_button.dart';

import '../sevices/auth/auth_sevices.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    AuthSevices _auth = AuthSevices();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'S E T T I N G',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                _auth.logout();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomPage()));
                setState(() {});
              },
              child: MyButton(name: 'Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
