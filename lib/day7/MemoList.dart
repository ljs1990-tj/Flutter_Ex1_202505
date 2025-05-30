import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'MemoEdit.dart';

void main() async {
  // Flutter 프레임워크와의 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 초기화 설정
  );
  runApp(MemoListApp());
}

class MemoListApp extends StatelessWidget {
  const MemoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : MomoListExam()
    );
  }
}

class MomoListExam extends StatefulWidget {
  const MomoListExam({super.key});

  @override
  State<MomoListExam> createState() => _MomoListExamState();
}

class _MomoListExamState extends State<MomoListExam> {
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  void editMemo(String id, String currentName, String currentText){
    TextEditingController nameTextCtrl = TextEditingController(text : currentName);
    TextEditingController editTextCtrl = TextEditingController(text : currentText);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title : Text("수정"),
          content: Column(
            children: [
              TextField(
                controller: nameTextCtrl,
              ),
              TextField(
                controller: editTextCtrl,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  await fs.collection("memoList").doc(id).update({
                    "name" : nameTextCtrl.text,
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
  void removeMemo(String id) async {
    await fs.collection("memoList").doc(id).delete();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("메모 리스트")),
      body : StreamBuilder(
        stream: fs.collection("memoList").orderBy("name").snapshots(),
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
                title : Text("작성자 : ${doc["name"]}"),
                subtitle: Text("내용 : ${doc["text"]}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => editMemo(doc.id, doc["name"], doc["text"]),
                        icon: Icon(Icons.edit)
                    ),
                    IconButton(
                        onPressed: () => removeMemo(doc.id),
                        icon: Icon(Icons.delete)
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MemoEdit(),)
            );
          },
          child: Icon(Icons.add),
      ),
    );
  }
}


