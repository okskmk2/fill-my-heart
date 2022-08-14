import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/vase_form/vase_form_page.dart';

import '../layout/main_screen.dart';

final List<String> imgList = ['assets/icons/dd 1.png'];

class HomePage extends StatefulWidget {
  // constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/HPbackground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 59, left: 24),
                width: double.infinity,
                height: 77,
                child: Text(
                  '2022.07.12 ~ 진행중',
                  style: TextStyle(
                    color: CustomStyles.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8, left: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '동그라미',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: CustomStyles.primaryColor),
                        ),
                        Text(
                          '님의 감사나무',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Text(
                            '편지 ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: CustomStyles.primaryColor),
                          ),
                          Text(
                            '개',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 43, left: 24),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        width: 2,
                        color: Color(0xffE9E1D3),
                      ),
                    ),
                  ),
                  child: Container(
                    height: 115,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Color(0xffE9E1D3),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                              '편지쓰기 순서'),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VaseFormPage(),
                                ),
                              );
                            },
                            label: Text(
                              '화분 만들기',
                              style: TextStyle(color: Color(0xff6A6253)),
                            ),
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0)),
                            icon: Icon(
                              Icons.chevron_right,
                              color: Color(0xff6A6253),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => MainScreen(
                                    selectedIndex: 1,
                                  ),
                                ),
                              );
                            },
                            label: Text(
                              '감사카드 쓰기',
                              style: TextStyle(color: Color(0xff6A6253)),
                            ),
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0)),
                            icon: Icon(
                              Icons.chevron_right,
                              color: Color(0xff6A6253),
                            ),
                          ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/bigvase1.png',
                            width: 162, height: 174),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Color(0xffE9E1D3),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [0, 1, 2, 3, 4, 5]
                    .map(
                      (i) => Container(
                        padding: EdgeInsets.only(
                            left: 3, right: 3, bottom: 10, top: 10),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/component_card.png',
                            ),
                            Positioned(
                              top: 70,
                              left: 20,
                              right: 20,
                              child: Text(
                                "동그라미님 감사합니다.",
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
