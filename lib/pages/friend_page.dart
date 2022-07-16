import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  // constructor
  FriendPage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "친구1",
        "imgUrl": "",
      },
      {
        "category": "친구2",
        "imgUrl": "",
      },
      {
        "category": "친구3",
        "imgUrl": "",
      },
      {
        "category": "친구4",
        "imgUrl": "",
      },
      {
        "category": "친구5",
        "imgUrl": "",
      },
      {
        "category": "친구6",
        "imgUrl": "",
      },
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
                  margin: const EdgeInsets.all(8),
                  // 위젯들을 위로 중첩하기 위해 Stack 위젯 사용
                  child: Stack(
                    alignment: Alignment.center, // 중앙 정렬
                    children: [
                      /// 배경 이미지
                      Image.network(
                        imgUrl,
                        width: double.infinity, // 가득 채우기
                        height: 120,
                        fit: BoxFit
                            .cover, // 이미지 비율을 유지하며 주어진 width와 height를 가득 채우기
                      ),

                      /// 배경 위에 글씨가 보이도록 반투명한 박스 추가
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.black.withOpacity(0.5), // 투명도 50%
                      ),

                      /// 카테고리
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
