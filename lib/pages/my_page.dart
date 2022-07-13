import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  // constructor
  const MyPage({Key? key}) : super(key: key);
  final bottomIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Image.asset('assets/icons/새싹이미지.png'),
    );
  }
}
