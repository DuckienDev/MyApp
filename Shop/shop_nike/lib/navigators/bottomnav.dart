import 'package:flutter/material.dart';
import 'package:shop_nike/pages/chat_ai_page.dart';
import 'package:shop_nike/pages/home_page.dart';
import 'package:shop_nike/pages/cart_page.dart';
import 'package:shop_nike/pages/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentTabIndex = 0;

  late List<Widget> pages;
  late HomePage homePage;
  late ProfileUser profileUser;
  late CartPage oderPage;
  late ChatAiPage chatAiPage;

  @override
  void initState() {
    homePage = const HomePage();
    profileUser = const ProfileUser();
    oderPage = const CartPage();
    chatAiPage = const ChatAiPage();
    pages = [homePage, oderPage, chatAiPage, profileUser];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentTabIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CurvedNavigationBar(
          height: 75,
          backgroundColor: Colors.white,
          color: Colors.black,
          onTap: (int index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.chat_rounded,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
