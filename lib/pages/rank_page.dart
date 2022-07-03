import 'package:flutter/material.dart';

class RankPage extends StatelessWidget {
  // constructor
  const RankPage({Key? key}) : super(key: key);
  final bottomIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text('랭킹'),
    );
  }
}
