import 'package:flutter/material.dart';
import 'package:travelapp/home_main.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                  ),
                  Text(
                    'Setting',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10)
            ]),
          ),
        ),
      ),
      body: ListView(
        children: [
          Divider(),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text('Account and security'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined),
            title: Text('Privacy'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notification_add_outlined),
            title: Text('Notification'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.link_outlined),
            title: Text('Affiliate account'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.block_outlined),
            title: Text('Block'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Languages'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.display_settings_outlined),
            title: Text('Display'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.support_agent_outlined),
            title: Text('Support help'),
            onTap: () => null,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(blurRadius: 2, color: Colors.black)],
                ),
                child: Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
