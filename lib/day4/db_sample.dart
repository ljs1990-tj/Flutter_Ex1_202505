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
  Future<void> _fetchData() async {
    List<Map<String, dynamic>> data = await DB.getData();
    setState(() {
      item = data;  // 조회한 데이터를 리스트에 저장
    });
  }

  void editItem(int id, String name, int value){
    TextEditingController nameCtrl = TextEditingController(text : name);
    TextEditingController valueCtrl = TextEditingController(text : value.toString());

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title : Text("수정"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(labelText: "이름"),
                ),
                TextField(
                  controller: valueCtrl,
                  decoration: InputDecoration(labelText: "값"),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () async{
                    String editName = nameCtrl.text;
                    int editValue = int.tryParse(valueCtrl.text) ?? 0;

                    await DB.updateData(id, editName, editValue);
                    Navigator.of(context).pop();
                    _fetchData();
                  },
                  child: Text("저장")
              ),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("취소")
              )
            ],
          );
        },
    );

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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: (){
                              editItem(
                                item[index]["id"],
                                item[index]["name"],
                                item[index]["value"]
                              );
                            },
                            icon: Icon(Icons.edit)
                        ),
                        IconButton(
                            onPressed: () async {
                              int id = item[index]['id'];
                              await DB.deleteData(id);
                              _fetchData();
                            },
                            icon: Icon(Icons.delete)
                        )
                      ],
                    ),
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