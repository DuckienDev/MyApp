import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/screen/setting_screen.dart';
import 'package:travelapp/widget/NotificationWidget/noitification_widget.dart';

class NotificationScreenn extends StatelessWidget {
  const NotificationScreenn({super.key});

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
                    'Notification',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingScreen()));
                    },
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
                        Icons.settings,
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
          NotificationWidget(),
          SizedBox(height: 20),
          NotificationWidget(),
          SizedBox(height: 20),
          NotificationWidget(),
          SizedBox(height: 20),
          NotificationWidget(),
          SizedBox(height: 20),
          NotificationWidget(),
          SizedBox(height: 20),
          NotificationWidget(),
          SizedBox(height: 20),
          NotificationWidget(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
