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
  runApp(FireBaseApp());
}

class FireBaseApp extends StatelessWidget {
  const FireBaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : FireBaseExam()
    );
  }
}

class FireBaseExam extends StatefulWidget {
  const FireBaseExam({super.key});

  @override
  State<FireBaseExam> createState() => _FireBaseExamState();
}

class _FireBaseExamState extends State<FireBaseExam> {
  TextEditingController txtCtrl = TextEditingController();
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  void addItem() async {
    await fs.collection("items").add({
      "text" : txtCtrl.text,
      "qqq" : "zzz"
    });
    txtCtrl.clear();
  }

  void removeItem(String id) async{
      await fs.collection("items").doc(id).delete();
    }

    void editItem(String id, String currentText){
      TextEditingController editTextCtrl = TextEditingController(text : currentText);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title : Text("수정"),
            content: TextField(
              controller: editTextCtrl,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    await fs.collection("items").doc(id).update({
                      "text" : editTextCtrl.text
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text("수정")
              ),
              ElevatedButton(
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
      appBar: AppBar(title : Text("파이어스토어 실습1")),
      body : Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: txtCtrl,
                        decoration: InputDecoration(hintText: "텍스트 입력"),
                      )
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      onPressed: addItem,
                      child: Text("추가")
                  )
                ],
              ),
          ),
          Expanded(
              child: StreamBuilder(
                  stream: fs.collection("items").orderBy("text").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final doc = docs[index];
                          return ListTile(
                            title : Text(doc["text"]),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () => editItem(doc.id, doc["text"]),
                                    icon: Icon(Icons.edit)
                                ),
                                IconButton(
                                    onPressed: () => removeItem(doc.id),
                                    icon: Icon(Icons.delete)
                                )
                              ],
                            ),
                          );
                        },
                    );
                  },
              )
          )
        ],
      )
    );
  }
}

