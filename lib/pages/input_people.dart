import 'package:flutter/material.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/history_page.dart';
import 'package:thank_tree/pages/input_create.dart';
import 'package:thank_tree/pages/input_invite.dart';
import 'package:thank_tree/pages/send_finish.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputPeople extends StatefulWidget {
  @override
  _InputPeopleState createState() => _InputPeopleState();
}

String? member_count = '1';

// Define a corresponding State class.
// This class holds the data related to the Form.
class _InputPeopleState extends State<InputPeople> {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "몇 명이서\n만들고 싶나요?",
              style: Theme.of(context).textTheme.headline2,
            ),
            Column(
              children: <Widget>[
                // ListTile(
                //   title: const Text('Lafayette'),
                //   leading: Radio(
                //     value: '1',
                //     groupValue: member_count,
                //     onChanged: (String? value) {
                //       print(value);
                //       setState(() {
                //         member_count = value;
                //       });
                //     },
                //   ),
                // ),
                // ListTile(
                //   title: const Text('Thomas Jefferson'),
                //   leading: Radio(
                //     value: '2',
                //     groupValue: member_count,
                //     onChanged: (String? value) {
                //       print(value);
                //       setState(() {
                //         member_count = value;
                //       });
                //     },
                //   ),
                // ),
                SizedBox(
                  height: 36,
                ),

                RadioListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  selectedTileColor: Color(0xff2C8464),
                  selected: member_count == '1',
                  value: '1',
                  groupValue: member_count,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      member_count = value;
                    });
                  },
                  title: Text("2~10명"),
                ),

                SizedBox(
                  height: 16,
                ),

                RadioListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  selectedTileColor: Color(0xff2C8464),
                  selected: member_count == '2',
                  value: '2',
                  groupValue: member_count,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      member_count = value;
                    });
                  },
                  title: Text("11~20명"),
                ),

                SizedBox(
                  height: 16,
                ),

                RadioListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  selectedTileColor: Color(0xff2C8464),
                  selected: member_count == '3',
                  value: '3',
                  groupValue: member_count,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      member_count = value;
                    });
                  },
                  title: Text("21~30명"),
                ),

                SizedBox(
                  height: 16,
                ),

                RadioListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  selectedTileColor: Color(0xff2C8464),
                  selected: member_count == '4',
                  value: '4',
                  groupValue: member_count,
                  onChanged: (String? value) {
                    print(value);
                    setState(() {
                      member_count = value;
                    });
                  },
                  title: Text("31~40명"),
                ),

                SizedBox(
                  height: 16,
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
                            MaterialPageRoute(
                                builder: (context) => Inputcreate()),
                          );
                        },
                        child: Text("다음")),
                  ),
                )
              ],
            ),
          ])),
    );
  }
}
