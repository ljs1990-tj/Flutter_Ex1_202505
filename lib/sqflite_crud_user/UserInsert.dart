import 'package:flutter/material.dart';
import '/common/db.dart';
import 'UserList.dart';

void main() => runApp(UserInsert());

class UserInsert extends StatelessWidget {
  const UserInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : UserInsertExam()
    );
  }
}

class UserInsertExam extends StatefulWidget {
  const UserInsertExam({super.key});

  @override
  State<UserInsertExam> createState() => _UserInsertExamState();
}

class _UserInsertExamState extends State<UserInsertExam> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("sqflite 실습"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserList(),));
              },
              icon: Icon(Icons.list)
          )
        ],
      ),
      body : Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: "Name"
                ),
              ),
              TextField(
                controller: ageCtrl,
                decoration: InputDecoration(
                    labelText: "Age"
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    String name = nameCtrl.text;
                    int age = int.tryParse(ageCtrl.text) ?? 0;

                    await DB.insertUser(name, age);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("저장 되었음!"))
                    );
                    nameCtrl.clear();
                    ageCtrl.clear();
                  },
                  child: Text("사용자 추가")
              )
            ],
          ),
      )

    );
  }
}
