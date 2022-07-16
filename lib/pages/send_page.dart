import 'package:flutter/material.dart';
import 'package:thank_tree/pages/send_finish.dart';

class SendPage extends StatefulWidget {
  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://www.crushpixel.com/big-static19/preview4/pink-donut-icon-isometric-style-3400525.jpg",
                      width: 30,
                    ),
                  ),
                  Text(
                    '가나다라마바사아',
                    style: TextStyle(
                      fontSize: 18, // 폰트 크기
                      fontWeight: FontWeight.bold, // 폰트 두께
                      color: Color(0xff0ACC86), // 폰트 색상
                    ),
                  ),
                  Text(
                    '님 에게',
                    style: TextStyle(
                      fontSize: 18, // 폰트 크기
                      fontWeight: FontWeight.bold, // 폰트 두께
                      color: Colors.black, // 폰트 색상
                    ),
                  ),
                ],
              ),
              TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 12,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 241, 237, 237),
                    hintText: "상대방에게 감사한 마음을 담아보내주세요",
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xffA3A9B4)))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'From. 잔망 루피',
                      style: TextStyle(
                        fontSize: 15, // 폰트 크기
                        fontWeight: FontWeight.bold, // 폰트 두께
                        color: Color.fromARGB(255, 79, 82, 81), // 폰트 색상
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      '익명으로 보내기',
                      style: TextStyle(
                        fontSize: 12, // 폰트 크기
                        fontWeight: FontWeight.bold, // 폰트 두께
                        color: Color.fromARGB(255, 79, 82, 81), // 폰트 색상
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                      size: 10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.toggle_on,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 0, right: 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Sendfinish()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff0ACC86), // Background color
                        onPrimary:
                            Colors.white, // Text Color (Foreground color)
                      ),
                      child: Text("감사카드 보내기")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
