import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  // constructor
  const HistoryPage({Key? key}) : super(key: key);
  final bottomIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text('감사카드'),
    );
  }
}
