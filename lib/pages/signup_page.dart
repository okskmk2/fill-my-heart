import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thank_tree/services/auth_service.dart';

/// 로그인 페이지
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
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
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
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
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: passwordConfirmController,
                  obscureText: true, // 비밀번호 안보이게
                  decoration: InputDecoration(
                    hintText: "비밀번호를 확인해주세요",
                  ),
                ),
                SizedBox(height: 32),

                /// 회원가입 버튼
                ElevatedButton(
                  child: Text("확인", style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    // 회원가입
                    authService.signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("회원가입에 성공하였습니다."),
                        ));
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
