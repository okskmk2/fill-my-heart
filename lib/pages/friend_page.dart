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
        "category": "동그라미",
        "imgUrl":
            "https://www.crushpixel.com/big-static19/preview4/pink-donut-icon-isometric-style-3400525.jpg",
        "email": "abcd1234@naver.com"
      },
      {
        "category": "잔망루피",
        "imgUrl":
            "https://www.crushpixel.com/big-static19/preview4/pink-donut-icon-isometric-style-3400525.jpg",
        "email": "saad38@naver.com"
      },
    ];

    // 화면에 보이는 영역
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "감사카드를\n보낼 친구를 찾아주세요",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: 36,
          ),

          /// 검색
          TextField(
            decoration: InputDecoration(
              hintText: "닉네임을 검색해주세요.",
              suffixIcon: IconButton(
                icon: Image.asset('assets/icons/search.png'),
                onPressed: () {
                  print("돋보기 아이콘 클릭");
                },
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),

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
                String email = data["email"];

                // 카드 형태의 위젯
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffD9D9D9),
                          backgroundImage: NetworkImage(imgUrl), //NetworkImage
                          radius: 30,
                        ), //CircleAvatar
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          category,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ), //Textstyle
                        ), //Text
                        SizedBox(
                          height: 10,
                        ), //SizedBox
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.touch_app),
                                  Text('감사카드 쓰기')
                                ],
                              ),
                            ),
                          ),
                        ) //SizedBox
                      ],
                    ), //Column
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
