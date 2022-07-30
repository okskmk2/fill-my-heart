import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:thank_tree/common/styles.dart';

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
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 20),
                width: double.infinity,
                height: 50,
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
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Column(children: [
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
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '편지',
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
                    ],
                  ),
                ]),
              ),
            ],
          ),
          // Expanded(
          //   flex: 3,
          //   child: Image.asset(
          //     'assets/background.png',
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Expanded(
            flex: 2,
              child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 20,
                      color: CustomStyles.backgroundColor,
                    ),
                    Container(
                      height: 20,
                      color: Color(0xffE9E1D3),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/bigvase.png',
              )
            ],
          )),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Color(0xffE9E1D3),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [0, 1, 2, 3, 4, 5]
                    .map(
                      (i) => Container(
                        padding: EdgeInsets.only(left: 3, right: 3, bottom: 10),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/component_card.png',
                            ),
                            Positioned(
                              top: 80,
                              left: 20,
                              right: 20,
                              child: Text(
                                "sdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfsd",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("1");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(selectedIndex: 1)),
          );
        },
        backgroundColor: Colors.black,
        child: SvgPicture.asset('assets/icons/card_edit.svg'),
      ),
    );
  }
}
