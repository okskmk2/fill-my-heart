import 'package:flutter/material.dart';
import 'package:thank_tree/pages/history_page.dart';
import 'package:thank_tree/pages/home_page.dart';
import 'package:thank_tree/pages/map_page.dart';
import 'package:thank_tree/pages/rank_page.dart';
import 'package:thank_tree/pages/send_page.dart';

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
    RankPage(),
    MapPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/logo.png',
          height: 32,
        ),
        title: Text('감사나무'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        ],
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
            label: '나무',
            icon: Icon(Icons.forest),
          ),
          BottomNavigationBarItem(
            label: '이력',
            icon: Icon(Icons.archive),
          ),
          BottomNavigationBarItem(
            label: '감사보내기',
            icon: Icon(Icons.send),
          ),
          BottomNavigationBarItem(
            label: '랭킹',
            icon: Icon(Icons.format_list_numbered),
          ),
          BottomNavigationBarItem(
            label: '지도',
            icon: Icon(Icons.map),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
