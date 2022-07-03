import 'package:flutter/material.dart';

class SendPage extends StatelessWidget {
  // constructor
  const SendPage({Key? key}) : super(key: key);
  final bottomIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text('감사보내기'),
    );
  }
}
