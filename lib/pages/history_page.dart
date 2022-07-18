import 'package:flutter/material.dart';
import 'package:thank_tree/pages/basic_gridview.dart';
import 'package:thank_tree/pages/dynamic_size_gridview.dart';
import 'package:thank_tree/pages/silver_gridview.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
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
    super.dispose(); // super는 항상 먼저 호출해야한다.
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("감사카드", style: Theme.of(context).textTheme.headline2),
            SizedBox(
              height: 24,
            ),
            TabBar(controller: controller, tabs: [
              Tab(text: "받은 감사"),
              Tab(text: "보낸 감사"),
              Tab(text: "즐겨찾기"),
            ]),
            Expanded(
              child: TabBarView(
                  controller: controller,
                  children: [SecondPage(), FirstPage(), ThirdPage()]),
            ),
          ],
        ),
      );
}
