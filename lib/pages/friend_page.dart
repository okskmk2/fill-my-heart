import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  // constructor
  FriendPage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 데이터
    List<Map<String, dynamic>> dataList = [
      {"category": "동그라미", "imgUrl": "", "email": "abcd1234@naver.com"},
      {"category": "잔망루피", "imgUrl": "", "email": "abcd5678@naver.com"},
    ];

    // 화면에 보이는 영역
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // 그림자 없애기
        backgroundColor: Colors.white, // 배경 색상
        centerTitle: false, // title 중앙 정렬
        iconTheme: IconThemeData(color: Colors.black), // app bar icon color
        title: Text(
          "",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "감사카드를",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              "보낼 친구를 찾아주세요",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// 검색
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "닉네임을 검색해주세요.",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                // 돋보기 아이콘
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("돋보기 아이콘 클릭");
                  },
                ),
              ),
            ),
          ),
          Divider(height: 1),

          /// 카테고리 목록
          Expanded(
            child: ListView.builder(
              // 보여주려는 데이터 개수
              itemCount: dataList.length,
              // itemCount 만큼 반복되며 화면에 보여주려는 위젯
              // index가 0부터 dataList.length - 1까지 증가하며 전달됩니다.
              itemBuilder: (context, index) {
                // dataList에서 index에 해당하는 data 꺼내기
                Map<String, dynamic> data = dataList[index];
                String category = data["category"];
                String imgUrl = data["imgUrl"];

                // 카드 형태의 위젯
                return Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    width: 300,
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[500],
                            radius: 30,
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.crushpixel.com/big-static19/preview4/pink-donut-icon-isometric-style-3400525.jpg"), //NetworkImage
                              radius: 30,
                            ), //CircleAvatar
                          ), //CircleAvatar
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          Text(
                            '동그라미',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          const Text(
                            'abcd1234@naver.com',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ), //Textstyle
                          ), //Text
                          const SizedBox(
                            height: 10,
                          ), //SizedBox
                          SizedBox(
                            width: 300,

                            child: ElevatedButton(
                              onPressed: () => 'Null',
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff0ACC86))),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.touch_app),
                                    Text('감사카드 쓰기')
                                  ],
                                ),
                              ),
                            ),
                            // RaisedButton is deprecated and should not be used
                            // Use ElevatedButton instead

                            // child: RaisedButton(
                            //   onPressed: () => null,
                            //   color: Colors.green,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(4.0),
                            //     child: Row(
                            //       children: const [
                            //         Icon(Icons.touch_app),
                            //         Text('Visit'),
                            //       ],
                            //     ), //Row
                            //   ), //Padding
                            // ), //RaisedButton
                          ) //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ); //Ca
              },
            ),
          ),
        ],
      ),
    );
  }
}
