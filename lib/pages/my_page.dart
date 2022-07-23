import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/start_page.dart';

class MyPage extends StatelessWidget {
  // constructor
  const MyPage({Key? key}) : super(key: key);
  final bottomIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "내가 받은 화분 12",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: double.infinity, // 폭
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    // 박스 색상
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset('assets/icons/vase1.png',
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Image.asset('assets/icons/vase2.png',
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Image.asset('assets/icons/vase1.png',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/shelf1.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ])),
                    Expanded(
                        child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset('assets/icons/vase2.png',
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Image.asset('assets/icons/vase1.png',
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Image.asset('assets/icons/vase2.png',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/shelf2.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ])),
                    Expanded(
                        child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset('assets/icons/vase1.png',
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Image.asset('assets/icons/vase2.png',
                                fit: BoxFit.cover),
                          ),
                          Expanded(
                            child: Image.asset('assets/icons/vase2.png',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/shelf3.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
