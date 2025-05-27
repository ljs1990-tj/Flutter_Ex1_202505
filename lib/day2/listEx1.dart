import 'package:flutter/material.dart';

void main() {
  runApp(const ListEx1());
}

class ListEx1 extends StatelessWidget {
  const ListEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text('제품 목록')
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset('img2.jpg', width: 60, height: 60, fit: BoxFit.cover),
              title: Text('중고 자전거', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('150,000원 · 서울 강남구'),
              onTap: () {},
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: Image.asset('img3.jpg', width: 60, height: 60, fit: BoxFit.cover),
              title: Text('노트북 Dell XPS', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('1,200,000원 · 서울 마포구'),
              onTap: () {},
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: Image.asset('img4.jpg', width: 60, height: 60, fit: BoxFit.cover),
              title: Text('에어팟 프로', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('230,000원 · 인천 부평구'),
              onTap: () {

              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
            ListTile(
              leading: Image.asset('img1.jpg', width: 60, height: 60, fit: BoxFit.cover),
              title: Text('책상 책장 세트', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('90,000원 · 인천 부평구'),
              onTap: () {

              },
            ),
            Divider(height: 1, color: Colors.grey[300]),
          ],
        ),
      )
    );
  }
}
