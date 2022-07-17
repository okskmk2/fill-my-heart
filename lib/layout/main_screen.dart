import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/pages/history_page.dart';
import 'package:thank_tree/pages/home_page.dart';
import 'package:thank_tree/pages/my_page.dart';
import 'package:thank_tree/pages/friend_page.dart';
import 'package:thank_tree/pages/send_page.dart';
import 'package:thank_tree/services/auth_service.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  const MainScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),
    SendPage(),
    FriendPage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    Color inactiveColor = Color(0xffC0C3CA);
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: SvgPicture.asset('assets/icons/card_edit.svg'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: inactiveColor,
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
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset('assets/icons/home.svg'),
          ),
          BottomNavigationBarItem(
            label: '감사카드',
            icon: SvgPicture.asset(
              'assets/icons/card.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/card.svg',
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: '감사카드 작성',
            icon: SvgPicture.asset('assets/icons/card_edit.svg'),
          ),
          BottomNavigationBarItem(
            label: '내 친구들',
            icon: SvgPicture.asset(
              'assets/icons/myfriend.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/myfriend.svg',
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'MY',
            icon: SvgPicture.asset(
              'assets/icons/my.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/my.svg',
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
