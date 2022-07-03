import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  // constructor
  const MapPage({Key? key}) : super(key: key);
  final bottomIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Image.asset('assets/map.jpg'),
    );
  }
}
