import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelapp/home_main.dart';
import 'package:travelapp/screen/setting_screen.dart';

class NotificationScreenn extends StatelessWidget {
  const NotificationScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    final message =
        ModalRoute.of(context)?.settings.arguments as RemoteMessage?;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
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
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 2,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: const Icon(Icons.arrow_back_ios_new, size: 20),
                      ),
                    ),
                    const Text(
                      'Notification',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()));
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 3,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: const Icon(
                          Icons.settings,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
      body: (message != null)
          ? Column(
              children: [
                Text(message.notification!.title.toString()),
                Text(message.notification!.body.toString()),
                Text(message.data.toString()),
              ],
            )
          : Center(
              child: Text("Don't have notification."),
            ),
    );
  }
}
