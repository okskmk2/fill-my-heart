import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  // constructor
  const FriendPage({Key? key}) : super(key: key);
  final bottomIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text('내 친구들'),
    );
  }
}
