import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

void main() async {
  // Flutter 프레임워크와의 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 초기화 설정
  );
  runApp(JoinApp());
}

class JoinApp extends StatelessWidget {
  const JoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : JoinExam()
    );
  }
}

class JoinExam extends StatefulWidget {
  const JoinExam({super.key});

  @override
  State<JoinExam> createState() => _JoinExamState();
}

class _JoinExamState extends State<JoinExam> {
  TextEditingController idCtrl = TextEditingController();
  TextEditingController pwd1Ctrl = TextEditingController();
  TextEditingController pwd2Ctrl = TextEditingController();
  TextEditingController addrCtrl = TextEditingController();
  bool checkedFlg = false;

  List<String> hobbyList = ["코딩", "영화감상", "독서", "운동", "게임"];
  List<String> selectList = [];
  FirebaseFirestore fs = FirebaseFirestore.instance;
  void idCheck() async {
    var checked = await fs.collection("userList").where("userId", isEqualTo: idCtrl.text).get();

    if(checked.docs.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("이미 있는 아이디임"))
      );
      return;
    } else {
      setState(() {
        checkedFlg = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("사용 가능한 아이디!"))
      );
    }

  }
  void join() async{

    if(pwd1Ctrl.text != pwd2Ctrl.text){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("패스워드 확인하셈"))
      );
      return;
    }

    await fs.collection("userList").add({
      "userId" : idCtrl.text,
      "pwd" : pwd1Ctrl.text,
      "addr" : addrCtrl.text,
      "hobbyList" : selectList
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("회원 가입 성공!"))
    );
    idCtrl.clear();
    pwd1Ctrl.clear();
    pwd2Ctrl.clear();
    addrCtrl.clear();
    setState(() {
      selectList = [];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("회원가입")),
      body : Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: idCtrl,
                      enabled: !checkedFlg,
                      decoration: InputDecoration(hintText: "아이디"),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: idCheck,
                      child: Text("중복확인")
                  )
                ],
              ),
              TextField(
                controller: pwd1Ctrl,
                obscureText: true,
                decoration: InputDecoration(hintText: "비밀번호"),
              ),
              TextField(
                controller: pwd2Ctrl,
                obscureText: true,
                decoration: InputDecoration(hintText: "비밀번호 확인"),
              ),
              TextField(
                controller: addrCtrl,
                decoration: InputDecoration(hintText: "주소"),
              ),
              SizedBox(height: 20,),
              Text("취미 선택", style : TextStyle(fontWeight: FontWeight.bold)),
              ...hobbyList.map((hobby) {
                return CheckboxListTile(
                    title : Text(hobby),
                    value : selectList.contains(hobby),
                    onChanged: (value) {
                      // 선택할 경우 selectList 추가
                      // 해제할 경우 selectList 제거
                      setState(() {
                        if(value!){
                          selectList.add(hobby);
                        } else {
                          selectList.remove(hobby);
                        }
                      });
                    },
                );
              },),
              ElevatedButton(
                  onPressed: checkedFlg ? join : null,
                  child: Text("회원 가입")
              )
            ],
          ),
      )
    );
  }
}

