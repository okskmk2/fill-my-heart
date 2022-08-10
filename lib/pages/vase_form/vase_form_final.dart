import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/vase_form/input_invite.dart';

class InputCreate extends StatefulWidget {
  const InputCreate({Key? key}) : super(key: key);

  @override
  InputCreateState createState() => InputCreateState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class InputCreateState extends State<InputCreate> {
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "감사화분이 완성되었어요!\n함께할 맴버를 초대해주세요",
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Image.asset(
                      'assets/base.png',
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/icons/logo_kakaotalk.png'),
                  label: Text('카카오톡 공유하기'),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50.0)),
                      foregroundColor:
                          MaterialStateProperty.all(CustomStyles.textColor),
                      backgroundColor: MaterialStateProperty.all(Color(0xffFFE812)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/링크아이콘.svg'),
                  label: Text('초대링크 복사하기'),
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 50.0)),
                      foregroundColor:
                          MaterialStateProperty.all(CustomStyles.textColor),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ))),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InputInvite()),
                    );
                  },
                  child: Text("감사카드 쓰기")),
            )
          ],
        ),
      ),
    );
  }
}
