import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thank_tree/pages/vase_form/input_people.dart';
import 'package:intl/intl.dart';

class InputTime extends StatefulWidget {
  const InputTime({Key? key}) : super(key: key);

  @override
  InputTimeState createState() => InputTimeState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class InputTimeState extends State<InputTime> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final dateFormat = DateFormat("yyyy-MM-dd");
  final tiemFormat = DateFormat("HH:mm");

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "편지쓰기 마감시간을\n설정해주세요",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 36,
            ),
            Text('날짜 선택'),
            TextField(
              controller: dateController,
              onTap: () {
                DateTime initialDate;
                try {
                  initialDate = dateFormat.parse(dateController.text);
                } catch (e) {
                  initialDate = DateTime.now();
                }
                Future<DateTime?> datePicker = showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: initialDate,
                  lastDate: DateTime(2100),
                );
                datePicker.then((value) {
                  if (value != null) {
                    setState(() {
                      dateController.text = dateFormat.format(value);
                    });
                  }
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Text('시간 선택'),
            TextField(
              controller: timeController,
              onTap: () {
                TimeOfDay initialTime;
                try {
                  initialTime = TimeOfDay.fromDateTime(
                      tiemFormat.parse(timeController.text));
                } catch (e) {
                  initialTime = TimeOfDay.now();
                }
                Future<TimeOfDay?> timePicker = showTimePicker(
                  context: context,
                  initialTime: initialTime,
                );
                timePicker.then((value) {
                  if (value != null) {
                    setState(() {
                      timeController.text = value.to24hours();
                    });
                  }
                });
              },
            ),
            Center(
                child: Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.grey,
                    child: Text(
                        '왜 마감시간을 설정해야하나요? 마감시간이 되면 자동으로 편지를 발송해드려요. 마감시간내에 편지 작성을 잊지마세요!'))),
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
                      MaterialPageRoute(builder: (context) => InputPeople()),
                    );
                  },
                  child: Text("다음"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}
