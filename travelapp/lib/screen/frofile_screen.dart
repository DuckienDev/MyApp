import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:travelapp/apps/router/router_name.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          SizedBox(height: 75),
          Center(
            child: Text(
              'DucKien',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: [
              ListTile(
                leading: Text(
                  'Full Name :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                title: Text('Nguyen Duc Kien'),
              ),
              Divider(),
              ListTile(
                leading: Text(
                  'Gender :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                title: Text('Male'),
              ),
              Divider(),
              ListTile(
                leading: Text(
                  'Date Of Birth :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                title: Text('10/06/2003'),
              ),
              Divider(),
              ListTile(
                leading: Text(
                  'Phone Number :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                title: Text('0368665666'),
              ),
              Divider(),
              ListTile(
                leading: Text(
                  'Email :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                title: Text('nguyenkiendy2003@gmail.com'),
              ),
              Divider(),
              ListTile(
                leading: Text(
                  'Address :',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                title: Text('Ha Noi, Viet Nam'),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    context.goNamed(RouterName.welcome);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(blurRadius: 2, color: Colors.black)
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        buildCoverImgae(),
        Positioned(top: 150, child: buildAvatarImage()),
      ],
    );
  }

  Widget buildCoverImgae() => Container(
        child: Image.network(
          'https://cover-talk.zadn.vn/6/d/3/d/4/c0fbcb6b97e0fb3016428addb6d1ba30.jpg',
          width: double.infinity,
          height: 230,
          fit: BoxFit.cover,
        ),
      );
  Widget buildAvatarImage() => Container(
        width: 150,
        height: 150,
        child: CircleAvatar(
          child: ClipOval(
            child: Image.network(
              'https://zpsocial-f52-org.zadn.vn/8114598cc2c0229e7bd1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
}
