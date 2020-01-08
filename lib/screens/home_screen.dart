import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lost_inator/screens/create_item.dart';
import 'package:lost_inator/screens/feed_screen.dart';
import 'package:lost_inator/screens/profile_screen.dart';
import 'package:lost_inator/screens/search_screen.dart';
import 'package:lost_inator/services/auth_services.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "homeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          FeedScreen(),
          SearchScreen(),
          CreateScreen(),
          // ProfileScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          // ),
        ],
      ),
    );
  }
}
