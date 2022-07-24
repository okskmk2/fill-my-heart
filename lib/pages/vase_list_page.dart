import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class VaseListPage extends StatelessWidget {
  final vaseSize = 130.0;
  // constructor
  const VaseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "내가 받은 화분 12",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 30),
          Expanded(
            flex: 1,
            child: Swiper(
              control: SwiperControl(),
              pagination: SwiperPagination(),
              loop: false,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/icons/vase1.png',
                              height: vaseSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/icons/vase2.png',
                              height: vaseSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/icons/vase1.png',
                              height: vaseSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/shelf1.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ])),
                    Expanded(
                        child: Column(children: [
                      Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/icons/vase2.png',
                              height: vaseSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/icons/vase1.png',
                              height: vaseSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/icons/vase2.png',
                              height: vaseSize,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icons/shelf2.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    ])),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/icons/vase1.png',
                                  height: vaseSize,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/icons/vase2.png',
                                  height: vaseSize,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  'assets/icons/vase2.png',
                                  height: vaseSize,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/icons/shelf3.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
