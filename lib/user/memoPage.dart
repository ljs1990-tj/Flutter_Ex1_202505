import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MemoPageApp extends StatefulWidget {
  final String docId;
  const MemoPageApp({super.key, required this.docId});

  @override
  State<MemoPageApp> createState() => _MemoPageAppState();
}

class _MemoPageAppState extends State<MemoPageApp> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController contentsCtrl = TextEditingController();

  Future<void> saveMemo() async {
    await FirebaseFirestore.instance
        .collection("userList")
        .doc(widget.docId)
        .collection("memoList")
        .add({
          "title" : titleCtrl.text,
          "contents" : contentsCtrl.text,
          "createDate" : Timestamp.now()
        });
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("메모 작성")),
      body : Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: titleCtrl,
                decoration: InputDecoration(labelText: "제목"),
              ),
              TextField(
                controller: contentsCtrl,
                decoration: InputDecoration(labelText: "내용"),
                maxLines: 5,
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: saveMemo,
                  child: Text("저장")
              )

            ],
          ),
      )
    );
  }
}
