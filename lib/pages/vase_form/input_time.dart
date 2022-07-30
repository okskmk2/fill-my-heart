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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
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

              //  Center(
              //         child: Card(
              //           shape: RoundedRectangleBorder(  //모서리를 둥글게 하기 위해 사용
              //             borderRadius: BorderRadius.circular(16.0),
              //           ),
              //           elevation: 4.0, //그림자 깊이
              //           child: Icon(
              //               Icons.face,
              //               color: Colors.grey,
              //               size: 200,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   }
              // }

              SizedBox(
                height: 16,
              ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5, top: 38, bottom: 28),
                decoration: BoxDecoration(
                  color: Color(0xffE9E1D3),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "· 왜 마감시간을 설정해야하나요?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "마감시간이 되면 자동으로 편지를 발송해드려요.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff36332E),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "마감시간 내에 편지 작성을 잊지마세요!",
                      style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                        color: Color(0xff36332E),
                      ),
                    ),
                    SizedBox(height: 12),
                  ],
                ),
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
