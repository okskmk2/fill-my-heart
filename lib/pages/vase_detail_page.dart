import 'package:flutter/material.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/leaf_form_page.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("1");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LeafFormPage()),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.edit),
      ),
    );
  }
}
