import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/pages/history_page.dart';
import 'package:thank_tree/pages/home_page.dart';
import 'package:thank_tree/pages/my_page.dart';
import 'package:thank_tree/pages/friend_page.dart';
import 'package:thank_tree/pages/send_page.dart';
import 'package:thank_tree/services/auth_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),
    SendPage(),
    FriendPage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '나무',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '감사카드',
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            label: '감사카드 작성',
            icon: Icon(Icons.edit),
          ),
          BottomNavigationBarItem(
            label: '내 친구들',
            icon: Icon(Icons.search_rounded),
          ),
          BottomNavigationBarItem(
            label: 'MY',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
