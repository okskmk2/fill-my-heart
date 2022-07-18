import 'package:flutter/material.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/history_page.dart';

class Sendfinish extends StatefulWidget {
  @override
  State<Sendfinish> createState() => _SendfinishState();
}

class _SendfinishState extends State<Sendfinish> {
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
        title: const Text(
          '',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Center(
        /** Card Widget **/
        child: Card(
          elevation: 50,
          shadowColor: Color.fromARGB(255, 255, 255, 255),
          color: Color.fromARGB(255, 240, 237, 237),
          child: SizedBox(
            width: 300,
            height: 500,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff0ACC86),
                    radius: 108,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.dribbble.com/users/1097272/screenshots/10744485/media/fbd89f6862b321afa9473905e71bbb86.png?compress=1&resize=400x300&vertical=top"), //NetworkImage
                      radius: 100,
                    ), //CircleAvatar
                  ), //CircleAvatar
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '가나다라마바사아',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ),
                      Text(
                        '님에게',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ), //Textstyle
                      ),
                    ],
                  ), //Text //Text
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    '님에게 마음을 전달했어요!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ), //Textstyle
                  ), //Text
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainScreen(selectedIndex: 1)),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.touch_app), Text('감사내역 보기')],
                    ),
                  ) //SizedBox
                ],
              ), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ), //Center
    ); //Scaffold
  }
}
