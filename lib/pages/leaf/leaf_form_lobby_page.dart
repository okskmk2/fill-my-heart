import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/login_page.dart';
import 'package:thank_tree/pages/signup_page.dart';
import 'package:thank_tree/services/vase_service.dart';

class LeafFormLobbyPage extends StatelessWidget {
  const LeafFormLobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Provider.of<VaseService>(context).getMyVase(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Text('로딩중입니다.'),
            );
          }
          final vases = snapshot.data?.docs ?? [];
          final vase = vases[0];
          String title = vase.get('title');
          String receiveUID = vase.get('receiveUID');
          var dueDateTime = vase.get('dueDateTime');
          final diffTime =
              DateTime.now().difference(DateTime.parse(dueDateTime));
          final diffD = diffTime.inMinutes ~/ (60 * 24);
          final diffH = diffTime.inMinutes ~/ 60;
          final diffM = diffTime.inMinutes % 60;
          String maxMemberCount = vase.get('maxMemberCount').toString();
          String publicLinkUrl;
          String status;
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/화분상세배경.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 24,
                    left: 24,
                    top: 50,
                    bottom: 14,
                  ),
                  child: Text(
                    '감사카드 쓰기',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 22, right: 22, top: 14),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "To. $receiveUID",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: CustomStyles.primaryColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20, top: 6),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text("남은시간"),
                                      Text("$diffD일 $diffH시간 $diffM분")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("참여인원"),
                                      Text("$maxMemberCount명")
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Positioned(
                              bottom: 339,
                              left: 49,
                              child: Text("여기에\n감사카드를 써주세요!"),
                            ),
                            Positioned(
                              bottom: 273,
                              left: 116,
                              child: Image.asset('assets/동글뱅이화살표.png'),
                            ),
                            Positioned(
                              bottom: 207,
                              left: 113,
                              child: GestureDetector(
                                onTap: () {
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    Navigator.pushNamed(context, '/leaf-form');
                                    return;
                                  }
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Text(
                                              '아쉽게도 프링 회원만\n감사카드를 쓸 수 있어요.',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900,
                                                color: CustomStyles.dBrownColor,
                                              ),
                                            ),
                                            actions: [
                                              // 이미 회원이다. => 로그인 페이지
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white,
                                                  side: BorderSide(
                                                    width: 1,
                                                    color: CustomStyles
                                                        .dBrownColor,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  // Navigator.pop(context);
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginPage(
                                                                onSuccessCallbackRouteName:
                                                                    '/leaf-form')),
                                                  );
                                                },
                                                child: Text(
                                                  '이미 회원이에요.',
                                                  style: TextStyle(
                                                    color: CustomStyles
                                                        .dBrownColor,
                                                  ),
                                                ),
                                              ),
                                              // 회원이 아니다. => 회원가입 페이지
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SignUpPage(
                                                                onSuccessCallbackRouteName:
                                                                    '/leaf-form')),
                                                  );
                                                },
                                                child: Text('회원이 될래요.'),
                                              )
                                            ],
                                          ));
                                },
                                child: Image.asset(
                                  'assets/leaf1.png',
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/bigvase.png',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
