import 'package:flutter/material.dart';
import 'package:thank_tree/pages/basic_gridview.dart';
import 'package:thank_tree/pages/dynamic_size_gridview.dart';
import 'package:thank_tree/pages/silver_gridview.dart';

class PostOfficePage extends StatefulWidget {
  const PostOfficePage({Key? key}) : super(key: key);

  @override
  State<PostOfficePage> createState() => _PostOfficePageState();
}

class _PostOfficePageState extends State<PostOfficePage>
    with SingleTickerProviderStateMixin {
  // custom tab bar controller
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // SingleTockerProviderStateMixin is used to control the animation of the tab bar controller
    controller = TabController(length: 2, vsync: this);
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("화분 우체국", style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 24,
          ),
          TabBar(controller: controller, tabs: [
            Tab(text: "진행 중"),
            Tab(text: "보내기 완료"),
          ]),
          Expanded(
            child: TabBarView(controller: controller, children: [
              DoingTabView(),
              DoneTabView(),
            ]),
          ),
        ]),
      );
}

class DoingTabView extends StatelessWidget {
  const DoingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) {
        return Divider(thickness: 1);
      },
      itemCount: 3,
      itemBuilder: (buildContext, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(8),
          // visualDensity: VisualDensity.comfortable,
          leading: CircleAvatar(
            // minRadius: 5,
            radius: 40,
            backgroundColor: Color(0x88EBDBB9),
            child: Image.asset(
              'assets/icons/vase1.png',
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 2,
            ),
            child: Text("홍길동님에게 전달까지\n7일 2시간 10분 남았어요"),
          ),
        );
      },
    );
  }
}

class DoneTabView extends StatelessWidget {
  const DoneTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('보내기 완료');
  }
}
