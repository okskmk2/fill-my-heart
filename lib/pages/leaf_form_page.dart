import 'package:flutter/material.dart';
import 'package:thank_tree/common/styles.dart';

class LeafFormPage extends StatelessWidget {
  const LeafFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 24,
            left: 24,
            top: 50,
            bottom: 14,
          ),
          child: Text(
            '감사카드 쓰기',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22, right: 22, top: 14),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text("To. 동그라미"),
                      Text("생일추카추카츄"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("남은시간"),
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 1,
                            width: 4,
                          ),
                          Text("참여인원")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                'assets/bigvase.png',
              )
            ],
          ),
        ),
      ],
    );
  }
}
