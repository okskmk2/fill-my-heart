import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/layout/main_screen.dart';

class VaseDetailPage extends StatelessWidget {
  const VaseDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '편지 확인하기',
          style: TextStyle(
            color: CustomStyles.textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '보내기',
              style: TextStyle(
                color: CustomStyles.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/vase1.png'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '생일추카추카츄',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: CustomStyles.textColor),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2022.07.12~진행중",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: CustomStyles.dBrownColor)),
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
                      child: Text(
                        '맴버들 -> 동그라미',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: CustomStyles.inputLineColor),
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
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  height: 184,
                  color: Colors.amber,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text("햇살님 항상 잘 챙겨주셔서 감사해요"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("1");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(selectedIndex: 1)),
          );
        },
        backgroundColor: Colors.black,
        child: SvgPicture.asset('assets/icons/card_edit.svg'),
      ),
    );
  }
}
