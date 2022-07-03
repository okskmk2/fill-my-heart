import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  User? currentUser() {
    // 현재 유저(로그인 되지 않은 경우 null 반환)
    return FirebaseAuth.instance.currentUser;
  }

  // 회원가입
  void signUp({
    required String email, // 이메일
    required String password, // 비밀번호
    required Function onSuccess, // 가입 성공시 호출되는 함수
    required Function(String err) onError, // 에러 발생시 호출되는 함수
  }) async {
    // 유효성검사
    if (email.isEmpty) {
      onError("이메일을 입력해주세요");
      return;
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해주세요");
      return;
    }

    try {
      // 성공
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      // 회원가입실패
      onError(e.message!);
    } catch (e) {
      // 서버통신실패
      onError(e.toString());
    }

    // notifyListeners();
  }

  // 로그인
  void signIn({
    required String email, // 이메일
    required String password, // 비밀번호
    required Function onSuccess, // 로그인 성공시 호출되는 함수
    required Function(String err) onError, // 에러 발생시 호출되는 함수
  }) async {
    // 유효성 검사
    if (email.isEmpty) {
      onError("이메일을 입력해주세요");
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해주세요.");
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      onError(e.message!);
    } catch (e) {
      onError(e.toString());
    }
  }

  void signOut() async {
    // 로그아웃
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
