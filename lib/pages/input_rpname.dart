import 'package:flutter/material.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/history_page.dart';
import 'package:thank_tree/pages/input_people.dart';
import 'package:thank_tree/pages/input_time.dart';
import 'package:thank_tree/pages/send_finish.dart';

class InputRPname extends StatefulWidget {
  @override
  _InputRPnameState createState() => _InputRPnameState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _InputRPnameState extends State<InputRPname> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "롤링페이퍼 제목을\n지어주세요",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(hintText: '예) 선생님 감사해요'),
                  controller: myController,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 0, right: 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inputtime()),
                      );
                    },
                    child: Text("확인")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
