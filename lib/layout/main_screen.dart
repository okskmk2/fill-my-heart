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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: Image.asset('assets/icons/card_edit.png'),
      ),
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
            label: '홈',
            icon: Image.asset('assets/icons/home.png'),
          ),
          BottomNavigationBarItem(
            label: '감사카드',
            icon: Image.asset('assets/icons/card.png'),
          ),
          BottomNavigationBarItem(
            label: '감사카드 작성',
            icon: Image.asset('assets/icons/card_edit.png'),
          ),
          BottomNavigationBarItem(
            label: '내 친구들',
            icon: Image.asset('assets/icons/myfriend.png'),
          ),
          BottomNavigationBarItem(
            label: 'MY',
            icon: Image.asset('assets/icons/my.png'),
          ),
        ],
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
