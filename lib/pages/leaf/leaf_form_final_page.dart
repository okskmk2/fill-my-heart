import 'package:flutter/material.dart';
import 'package:thank_tree/layout/main_screen.dart';

class LeafFormFinalPage extends StatelessWidget {
  const LeafFormFinalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  textAlign: TextAlign.center,
                  "홍길동닐에게\n전달될 편지가\n5번째로 채워졌어요!!",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w800, height: 1.4),
                ),
              ),
              Image.asset('assets/반짝이는화분.png'),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreen(selectedIndex: 0)),
                    );
                  },
                  child: Text("확인했어요"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
