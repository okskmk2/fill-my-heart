import 'package:flutter/material.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/vase_detail_page.dart';

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomStyles.primaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: CustomStyles.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 24,
                  right: 24,
                  bottom: 44,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "화분 우체국",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "내가 현재 만들고 있는 화분과\n이전에 전달한 화분을 보여드려요",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: CustomStyles.primaryColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Container(
                    color: CustomStyles.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TabBar(
                              isScrollable: true,
                              controller: controller,
                              tabs: [
                                Tab(text: '진행 중 12'),
                                Tab(text: "보내기 완료 10"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: controller,
                              children: [
                                DoingTabView(),
                                DoneTabView(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ),
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
      itemCount: 9,
      itemBuilder: (buildContext, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VaseDetailPage()),
            );
          },
          child: SizedBox(
            height: 116,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0xffE9E1D3),
                    ),
                    shape: BoxShape.circle,
                    color: Color(0x88EBDBB9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/icons/vase1.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "홍길동님에게 전달까지",
                        style: TextStyle(
                          color: Color(0xff36332E),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Text(
                            "7일 2시간 10분",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: CustomStyles.primaryColor),
                          ),
                          Text(
                            " 남았어요",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1F1E1C),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
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
