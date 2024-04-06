import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://zpsocial-f52-org.zadn.vn/8114598cc2c0229e7bd1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              margin: EdgeInsets.all(5),
              width: 280,
              child: Text(
                'Welcome back Nguyen Duc Kien, Are you ready for your journey? ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
