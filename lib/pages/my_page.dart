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
    /*return Container(
      alignment: AlignmentDirectional.center,
      child: Image.asset('assets/tree.jpg'),
    );*/
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 20, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "내가 받은 화분 12",
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            width: double.infinity, // 폭
            margin: EdgeInsets.only(top: 10),
            height: 470, // 높이
            decoration: BoxDecoration(color: Colors.white // 박스 색상
                ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                      ],
                    ),
                    Container(
                      child: Image.asset('assets/icons/Rectangle 40.png'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                      ],
                    ),
                    Container(
                      child: Image.asset('assets/icons/Rectangle 40.png'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 8, 3, 0),
                          child: Image.asset('assets/icons/tree.png'),
                        ),
                      ],
                    ),
                    Container(
                      child: Image.asset('assets/icons/Rectangle 40.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartPage()),
              );
            },
            child: Text(
              '로그아웃(디버깅용)',
            ),
          ),
        ],
      ),
    );
  }
}
