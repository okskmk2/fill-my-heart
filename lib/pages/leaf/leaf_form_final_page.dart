import 'package:flutter/material.dart';
import 'package:thank_tree/layout/main_screen.dart';

class LeafFormFinalPage extends StatelessWidget {
  const LeafFormFinalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("홍길동닐에게\n전달될 편지가\n5번째로 채워졌어요!!"),
          Image.asset('assets/bigvase.png'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen(selectedIndex: 0)),
                );
              },
              child: Text("확인했어요"))
        ],
      )),
    );
  }
}
