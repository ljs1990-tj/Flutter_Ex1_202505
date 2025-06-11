import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample1/user/userInfo.dart';
import '../firebase_options.dart';

void main() async {
  // Flutter 프레임워크와의 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 초기화 설정
  );
  runApp(UserListApp());
}

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : UserListPage()
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("사용자 목록")),
      body : StreamBuilder(
          stream: FirebaseFirestore.instance.collection("userList").snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            final userList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    title : Text(user["userId"]),
                    subtitle: Text(user["addr"]),
                    trailing: IconButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => UserInfo(docId : user.id),
                              )
                          );
                        },
                        icon: Icon(Icons.arrow_right)
                    ),
                  );
                },
            );
          },
      )
    );
  }
}

