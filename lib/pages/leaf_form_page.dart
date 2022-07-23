import 'package:flutter/material.dart';
import 'package:thank_tree/common/styles.dart';

class LeafFormPage extends StatelessWidget {
  const LeafFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '누구에게 롤링페이퍼를 보낼까요?',
          style: TextStyle(
            color: CustomStyles.textColor,
          ),
        ),
      ),
      body: Text('잎사귀 쓰기 페이지'),
    );
  }
}
