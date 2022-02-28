import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx_mvvm/view/bot_nav_bar/health_screen.dart';
import 'package:news_app_getx_mvvm/view/bot_nav_bar/science_screen.dart';
import 'package:news_app_getx_mvvm/view/bot_nav_bar/sports_screen.dart';
import 'package:news_app_getx_mvvm/view_model/news_view_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(NewsViewModel());
  int currentIndex = 0;

  List<Widget> screens = [
    SportsScreen(),
    ScienceScreen(),
    HealthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text.rich(
            TextSpan(children: [
              TextSpan(
                text: 'News ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              TextSpan(
                text: 'App',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                label: 'Sports', icon: Icon(CommunityMaterialIcons.basketball)),
            BottomNavigationBarItem(
                label: 'Science',
                icon: Icon(CommunityMaterialIcons.flask_round_bottom)),
            BottomNavigationBarItem(
                label: 'Health', icon: Icon(Icons.health_and_safety)),
          ],
        ),
        body: screens[currentIndex]);
  }
}
