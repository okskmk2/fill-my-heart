import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LeafFormPage extends StatelessWidget {
  const LeafFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '홍길동 님에게',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: TextField(
              minLines: 8,
              maxLines: 10,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "상대방에게 감사한 마음을 담아보내주세요"),
            ),
          ),
          Align(alignment: Alignment.centerRight, child: Text("익명으로 보내기 (위젯 미구현)")),
          Padding(
            padding: const EdgeInsets.only(top: 36),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('편지 보내기'),
            ),
          )
        ]),
      ),
    );
  }
}
