import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shop_nike/models/profile.dart';
import 'package:shop_nike/pages/setting_page.dart';
import 'package:shop_nike/sevices/auth/auth_sevices.dart';
import 'package:shop_nike/widgets/my_profile.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthSevices _auth = AuthSevices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'P R O F I L E',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingPage()));
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder<DocumentSnapshot>(
        stream:
            _firestore.collection('user').doc(_auth.currentUser()).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.dotsTriangle(
                color: Colors.black,
                size: 40,
              ),
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData && snapshot.data != null) {
            Profile profile = Profile.fromMap(snapshot.data!.id,
                snapshot.data!.data() as Map<String, dynamic>);
            return MyProfile(
              styleText: Theme.of(context).textTheme.displayMedium,
              profile: profile,
              auth: _auth,
            );
          } else {
            return const Center(child: Text('No user profile found.'));
          }
        },
      ),
    );
  }
}
