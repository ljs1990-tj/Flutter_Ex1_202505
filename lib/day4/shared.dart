import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

void main() => runApp(SharedApp());

class SharedApp extends StatelessWidget {
  const SharedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : SharedExam()
    );
  }
}

class SharedExam extends StatefulWidget {
  const SharedExam({super.key});

  @override
  State<SharedExam> createState() => _SharedExamState();
}

class _SharedExamState extends State<SharedExam> {
  String? name = "로그인 해주세요.";
  TextEditingController nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("Shared preference")),
      body : Column(
        children: [
          TextField(controller: nameCtrl,),
          SizedBox(height: 20,),
          Text("현재 사용자 : $name"),
          ElevatedButton(onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("name", nameCtrl.text);
            nameCtrl.clear();
          }, child: Text("저장")),
          ElevatedButton(onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            setState(() {
              name = prefs.getString("name");
            });
          }, child: Text("불러오기")),
          ElevatedButton(onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove("name");
            setState(() {
              name = "로그인 해주세요.";
            });
          }, child: Text("삭제"))

        ],
      )
    );
  }
}
