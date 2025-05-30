import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class MemoEdit extends StatefulWidget {
  const MemoEdit({super.key});

  @override
  State<MemoEdit> createState() => _MemoEditState();
}

class _MemoEditState extends State<MemoEdit> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController textCtrl = TextEditingController();

  final FirebaseFirestore fs = FirebaseFirestore.instance;

  void addMemo() async{
    await fs.collection("memoList").add({
      "name" : nameCtrl.text,
      "text" : textCtrl.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("메모 추가")),
      body : Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: "이름"
                ),
              ),
              TextField(
                controller: textCtrl,
                decoration: InputDecoration(
                    labelText: "내용"
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    addMemo();
                    Navigator.of(context).pop();
                  },
                  child: Text("저장")
              )
            ],
          ),
      )
    );
  }
}
