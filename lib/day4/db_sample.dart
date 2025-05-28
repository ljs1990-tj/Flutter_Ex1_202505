import 'package:flutter/material.dart';
import '/common/db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite 실습',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DBWidget(),
    );
  }
}

class DBWidget extends StatefulWidget {
  @override
  _DBWidgetState createState() => _DBWidgetState();
}

class _DBWidgetState extends State<DBWidget> {
  List<Map<String, dynamic>> item = [];

  @override
  void initState() {
    super.initState();
    _fetchData();  // 데이터 조회 함수 호출
  }

  // 데이터베이스에서 데이터 조회
  void _fetchData() async {
    List<Map<String, dynamic>> data = await DB.getData();
    setState(() {
      item = data;  // 조회한 데이터를 리스트에 저장
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite 예제'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 데이터를 출력할 ListView
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(item[index]['name']),
                    subtitle: Text('Value: ${item[index]['value']}, Num: ${item[index]['num']}'),

                  );
                },
              ),
            ),
            // 새 데이터 추가 버튼
            ElevatedButton(
              onPressed: () async {
                await DB.insertData('추가된 아이템', 100, 3);
                _fetchData();  // 데이터 새로 고침
              },
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }
}