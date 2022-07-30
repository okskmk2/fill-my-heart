import 'package:flutter/material.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/vase_detail_page.dart';
import 'package:thank_tree/pages/vase_form/vase_form_page.dart';

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
          backgroundColor: Color(0xffCDE3DB),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              color: Color(0xffCDE3DB),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "화분 우체국",
                        style: TextStyle(
                          color: CustomStyles.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "화분은 작성된 잎편지들을\n모아서 전달하는 역할을 해요",
                        style: TextStyle(
                          color: CustomStyles.grey2,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          )),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VaseFormPage()),
                          );
                        },
                        child: Text(
                          "화분 만들기",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Positioned(
                        // left: 0,
                        // bottom: 0,
                        child: Image.asset('assets/화분3.png'),
                      ),
                      Positioned(
                        // right: 0,
                        child: Image.asset('assets/화분2.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: CustomStyles.primaryColor,
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
          ],
        ),
      );
}

class DoingTabView extends StatelessWidget {
  const DoingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            Divider(thickness: 1),
        itemCount: 9,
        itemBuilder: vaseCard);
  }
}

class DoneTabView extends StatelessWidget {
  const DoneTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            Divider(thickness: 1),
        itemCount: 9,
        itemBuilder: vaseCard);
  }
}

Widget vaseCard(context, index) {
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
}
