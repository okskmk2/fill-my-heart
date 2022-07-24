import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/leaf_form_page.dart';
import 'package:thank_tree/pages/post_office_page.dart';
import 'package:thank_tree/pages/home_page.dart';
import 'package:thank_tree/pages/my_page.dart';

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

  final List<Widget> pages = <Widget>[
    HomePage(),
    LeafFormPage(),
    MyPage(),
    PostOfficePage()
  ];

  @override
  Widget build(BuildContext context) {
    Color inactiveColor = Color(0xffC0C3CA);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,        
        unselectedFontSize: 10,
        selectedItemColor: CustomStyles.primaryColor,
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
            label: '감사카드 쓰기',
            icon: Icon(Icons.edit),
            // icon: SvgPicture.asset(
            //   'assets/icons/my.svg',
            //   color: inactiveColor,
            // ),
            // activeIcon: SvgPicture.asset(
            //   'assets/icons/my.svg',
            //   color: Colors.black,
            // ),
          ),
          BottomNavigationBarItem(
            label: '화분 보관함',
            icon: Icon(Icons.local_florist),
            // icon: SvgPicture.asset(
            //   'assets/icons/my.svg',
            //   color: inactiveColor,
            // ),
            // activeIcon: SvgPicture.asset(
            //   'assets/icons/my.svg',
            //   color: Colors.black,
            // ),
          ),
          BottomNavigationBarItem(
            label: '화분 우체국',
            icon: Icon(Icons.local_post_office),
            // icon: SvgPicture.asset(
            //   'assets/icons/card.svg',
            //   color: inactiveColor,
            // ),
            // activeIcon: SvgPicture.asset(
            //   'assets/icons/card.svg',
            //   color: Colors.black,
            // ),
          ),
        ],
      ),
      body: SafeArea(child: pages.elementAt(_selectedIndex)),
    );
  }
}
