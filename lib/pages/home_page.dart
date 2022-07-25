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
          Expanded(
            flex: 3,
            child: Column(
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
                Padding(
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
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/vase1.png',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.all(20),
                color: Color(0xffE9E1D3),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [0, 1, 2, 3, 4, 5]
                      .map(
                        (i) => Container(
                          padding: EdgeInsets.all(8),
                          height: 184,
                          child: Container(
                            padding: EdgeInsets.all(16),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Text("햇살님 항상 잘 챙겨주셔서 감사해요"),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )

                /*GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    height: 184,
                    color: Colors.amber,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text("햇살님 항상 잘 챙겨주셔서 감사해요"),
                        ],
                      ),
                    ),
                  ),
                ),*/
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
