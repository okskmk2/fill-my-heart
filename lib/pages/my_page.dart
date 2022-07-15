import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(top: 20, left: 0),
              child: Text(
                "내 정보",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity, // 폭
              margin: EdgeInsets.only(top: 0),
              height: 100, // 높이
              decoration: const BoxDecoration(
                color: Color.fromRGBO(246, 246, 246, 1), // 박스 색상
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Icon(
                      CupertinoIcons.person_crop_circle,
                      size: 48,
                      color: Color.fromRGBO(129, 129, 129, 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "감사포인트",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Image.asset(
                                'assets/icons/info.png',
                                height: 18,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "0P",
                          style: TextStyle(
                              color: Color.fromRGBO(10, 204, 134, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("1231@naver.com",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(116, 116, 116, 1),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 50, left: 0),
              child: Text(
                "내 포인트",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: Image.asset(
                    'assets/icons/info.png',
                    height: 32,
                    width: 32,
                  ),
                ),
                Text(
                  "아직 모은 포인트가 없어요!",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff0ACC86),
                    ),
                  ),
                  child: Text(
                    '감사카드 보내기',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
