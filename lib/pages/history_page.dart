import 'package:flutter/material.dart';
import 'package:thank_tree/pages/basic_gridview.dart';
import 'package:thank_tree/pages/dynamic_size_gridview.dart';
import 'package:thank_tree/pages/silver_gridview.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  // custom tab bar controller
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // SingleTockerProviderStateMixin is used to control the animation of the tab bar controller
    controller = TabController(length: 3, vsync: this);
    // refresh the state of the tab bar to display index on app bar and tab bar controller on app bar
    controller.addListener(() {
      setState(() {});
    });
  }

  // dispose the tab controller when the app is closed to avoid memory leaks
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // leading: IconButton(
            //   icon: Icon(CupertinoIcons.camera, color: Colors.black),
            //     onPressed: () {},
            //   ),
            //  actions: [
            //     IconButton(
            //        icon: Icon(CupertinoIcons.paperplane, color: Colors.black),
            //           onPressed: () {},
            //       )
            //   ],
            title: Text('감사 카드',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            centerTitle: false,
            elevation: 0,
            bottom: TabBar(controller: controller, tabs: [
              Tab(
                child: ElevatedButton(
                  child: Text("받은 감사"),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 40),
                    maximumSize: const Size(250, 40),
                    primary: Color(0xff0ACC86), // Background color
                    onPrimary: Colors.white, // Text Color (Foreground color)
                  ),
                ),
              ),
              Tab(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(250, 40),
                      maximumSize: const Size(250, 40),
                      primary: Color(0xff0ACC86), // Background color
                      onPrimary: Colors.white, // Text Color (Foreground color)
                    ),
                    child: Text(
                      "보낸 감사",
                    )),
              ),
              Tab(
                child: Text(
                  "",
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.bookmark,
                  size: 30,
                ),
              ),
            ]),
          ),
          // no of widgets must be same as parent (TabBar)
          body: TabBarView(
              controller: controller,
              children: [SecondPage(), FirstPage(), ThirdPage()]),
        ),
      );
}
