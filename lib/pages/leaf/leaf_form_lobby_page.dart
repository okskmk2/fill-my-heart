import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/login_page.dart';
import 'package:thank_tree/pages/signup_page.dart';

class LeafFormLobbyPage extends StatelessWidget {
  const LeafFormLobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 14),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text("To. 동그라미"),
                      Text("생일추카추카츄"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("남은시간"),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 4,
                          ),
                          Text("참여인원")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("여기에\n감사카드를 써주세요!"),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (FirebaseAuth.instance.currentUser != null) {
                            Navigator.pushNamed(context, '/leaf-form');
                            return;
                          }
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    // contentPadding: EdgeInsets.symmetric(
                                    //     vertical: 34, horizontal: 18),
                                    // actionsPadding:
                                    //     EdgeInsets.symmetric(horizontal: 8),
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
                                            color: CustomStyles.dBrownColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigator.pop(context);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage(onSuccessCallbackRouteName : '/leaf-form')),
                                          );
                                        },
                                        child: Text(
                                          '이미 회원이에요.',
                                          style: TextStyle(
                                            color: CustomStyles.dBrownColor,
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
                                                    SignUpPage(onSuccessCallbackRouteName : '/leaf-form')),
                                          );
                                        },
                                        child: Text('회원이 될래요.'),
                                      )
                                    ],
                                  ));
                        },
                        child: Image.asset(
                          'assets/leaf.png',
                        ),
                      ),
                      Image.asset(
                        'assets/bigvase.png',
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
