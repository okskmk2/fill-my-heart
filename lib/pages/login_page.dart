import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/services/auth_service.dart';

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "로그인",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    '아이디',
                    style: TextStyle(
                      color: Color(0xff747474),
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
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    '비밀번호',
                    style: TextStyle(
                      color: Color(0xff747474),
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

                SizedBox(height: 40),

                /// 회원가입 버튼
                ElevatedButton(
                  child: Text("확인", style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    // 회원가입
                    authService.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("로그인 성공"),
                        ));
                        // HomePage로 이동
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainScreen(selectedIndex: 0)),
                        );
                      },
                      onError: (errMsg) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(errMsg),
                        ));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
