import 'package:flutter/material.dart';
import 'package:thank_tree/layout/main_screen.dart';
import 'package:thank_tree/pages/content_model.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({Key? key}) : super(key: key);

  @override
  OnbordingPageState createState() => OnbordingPageState();
}

class OnbordingPageState extends State<OnbordingPage> {
  int currentIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        title: Text(""),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 24, right: 24, top: 38, bottom: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        contents[i].title,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2C8464),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        contents[i].image,
                        height: 150,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            //height: 56,
            margin: EdgeInsets.only(left: 24, right: 24, top: 28, bottom: 58),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainScreen(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },

//               child: Padding(
//                 padding: EdgeInsets.all(1),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [Icon(Icons.touch_app), Text('시작하기')],
//  ), ),

              child: Text("시작하기"),
            ),
          ),
        ],
      ),
    );
  }

  // child: Text(
  //     currentIndex == contents.length - 1 ? "Continue" : "시작하기"),
  // onPressed: () {
  //   if (currentIndex == contents.length - 1) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => Home(),
  //       ),
  //     );
  //   }
  //   _controller.nextPage(
  //     duration: Duration(milliseconds: 100),
  //     curve: Curves.bounceIn,
  //   );
  // },

  // color: Theme.of(context).primaryColor,
  // textColor: Colors.white,
  // shape: RoundedRectangleBorder(
  // borderRadius: BorderRadius.circular(20),

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: currentIndex == index
            ? Theme.of(context).primaryColor
            : Colors.grey,
      ),
    );
  }
}
