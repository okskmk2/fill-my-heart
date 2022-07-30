import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/onboarding.dart';
import 'package:thank_tree/services/auth_service.dart';

/// 로그인 페이지
class SignUpPage extends StatefulWidget {
  final String onSuccessCallbackRouteName;
  const SignUpPage({Key? key, this.onSuccessCallbackRouteName = ''})
      : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _onSuccessCallbackRouteName = '';

  @override
  void initState() {
    super.initState();
    _onSuccessCallbackRouteName = widget.onSuccessCallbackRouteName;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isValid = passwordController.text == passwordConfirmController.text;

    return Consumer<AuthService>(builder: (context, authService, child) {
      final user = authService.currentUser();
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// 현재 유저 로그인 상태
                Text(
                  "회원가입",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomStyles.dBrownColor,
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '아이디',
                    style: TextStyle(
                      color: CustomStyles.dBrownColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                /// 이메일
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "아이디를 입력해주세요",
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '비밀번호',
                    style: TextStyle(
                      color: CustomStyles.dBrownColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                /// 비밀번호
                TextField(
                  controller: passwordController,
                  obscureText: true, // 비밀번호 안보이게
                  decoration: InputDecoration(
                    hintText: "비밀번호를 입력해주세요",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: passwordConfirmController,
                  obscureText: true, // 비밀번호 안보이게
                  decoration: InputDecoration(
                    hintText: "비밀번호를 확인해주세요",
                    errorText: isValid ? null : '비밀번호가 일치하지 않습니다',
                  ),
                  onChanged: (text) {
                    setState(() => passwordConfirmController.text);
                  },
                ),
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    '닉네임',
                    style: TextStyle(
                      color: CustomStyles.dBrownColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                /// 이메일
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "닉네임를 입력해주세요",
                  ),
                ),
                SizedBox(height: 80),

                /// 회원가입 버튼
                ElevatedButton(
                  onPressed: isValid
                      ? () {
                          // 회원가입
                          authService.signUp(
                            email: emailController.text,
                            password: passwordConfirmController.text,
                            onSuccess: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("회원가입에 성공하였습니다."),
                              ));
                              if (_onSuccessCallbackRouteName.isNotEmpty) {
                                Navigator.pushReplacementNamed(
                                    context, _onSuccessCallbackRouteName);
                              } else {
                                SharedPreferences.getInstance()
                                    .then((sharedPreferences) {
                                  bool isOnboarded = sharedPreferences
                                          .getBool("isOnboarded") ??
                                      false;
                                  // 이미 온보드 켰다면 스킵한다.
                                  if (isOnboarded) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainScreen(),
                                      ),
                                    );
                                  }
                                  // 온보드 킨 적이 없다면 온보드로 간다
                                  else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OnbordingPage(),
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            onError: (errMsg) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(errMsg),
                              ));
                            },
                          );
                        }
                      : null,
                  child: Text("확인", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
