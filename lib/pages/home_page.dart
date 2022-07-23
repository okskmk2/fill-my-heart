import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:thank_tree/common/styles.dart';

final List<String> imgList = ['assets/icons/dd 1.png'];

class HomePage extends StatefulWidget {
  // constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.only(top: 40, left: 10),
              child: Text(
                softWrap: true,
                textAlign: TextAlign.left,
                "안녕하세요 OO님",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              height: 400,
              padding: EdgeInsets.all(8),
              child: Swiper(
                loop: false,
                control: SwiperControl(),
                pagination: SwiperPagination(),
                itemCount: imgList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(imgList[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

//page view
//acrouselController