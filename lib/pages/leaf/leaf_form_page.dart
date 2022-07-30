import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/leaf/leaf_form_final_page.dart';

class LeafFormPage extends StatefulWidget {
  const LeafFormPage({Key? key}) : super(key: key);

  @override
  State<LeafFormPage> createState() => _LeafFormPageState();
}

class _LeafFormPageState extends State<LeafFormPage> {
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  height: 60,
                ),
                Image.asset('assets/leaf.png')
              ],
            ),
            TextField(
              minLines: 8,
              maxLines: 10,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "상대방에게 감사한 마음을 담아보내주세요"),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                'From. 잔망 루피',
                style: TextStyle(
                  color: CustomStyles.inputLineColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("익명으로 보내기"),
                IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                    )),
                Switch(
                  value: isAnonymous,
                  onChanged: (value) {
                    setState(() {
                      isAnonymous = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: CustomStyles.primaryColor,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeafFormFinalPage()),
                  );
                },
                child: Text('편지 보내기'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
