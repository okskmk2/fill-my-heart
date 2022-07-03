import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // constructor
  const HomePage({Key? key}) : super(key: key);
  final bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text('감사나무'),
    );
  }
}
