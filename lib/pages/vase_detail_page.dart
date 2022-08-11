import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/layout/main_screen.dart';

class VaseDetailPage extends StatelessWidget {
  const VaseDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '생일추카추카츄',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: CustomStyles.textColor),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2022.07.12~진행중",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: CustomStyles.grey2)),
                ),
                Image.asset('assets/circlevase.png'),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE9E1D3),
                      borderRadius: BorderRadius.all(Radius.circular(23)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '햇살님',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: CustomStyles.inputLineColor),
                          ),
                          Text(
                            '에게 보낸 편지',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: CustomStyles.inputLineColor),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Color(0xffE9E1D3),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 20,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                color: Color(0xffE9E1D3),
                                height: 12,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                padding: EdgeInsets.only(top: 9, right: 12),
                                height: 48,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: CustomStyles.inputLineColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        '나',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Image.asset('assets/leaf.png', width: 60),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("햇살님 항상 잘 챙겨주셔서 감사해요"),
                              Text("From. 잔망 루피"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: ElevatedButton(
            child: Text('12:20:12 보내기'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreen(selectedIndex: 1)),
              );
            },
          )),
    );
  }
}
