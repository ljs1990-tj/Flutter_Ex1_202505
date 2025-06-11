import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample1/user/memoPage.dart';

class UserInfo extends StatelessWidget {
  final String docId;
  const UserInfo({super.key, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("회원 상세정보")),
      body : FutureBuilder(
          future: FirebaseFirestore.instance.collection("userList").doc(docId).get(),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: Text("데이터 찾을 수 없음"));
            }
            final user = snapshot.data!.data() as Map<String, dynamic>;
            final hobbyList = List<String>.from(user["hobbyList"] ?? []);
            return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("아이디 : ${user['userId']}"),
                    SizedBox(height: 10,),
                    Text("주소 : ${user['addr']}"),
                    SizedBox(height: 10,),
                    Wrap(
                      spacing: 8,
                      children: hobbyList.map((hobby) {
                          return Chip(
                            label : Text(hobby),
                            backgroundColor: Colors.blue[50],
                          );
                      }).toList(),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                builder: (context) => MemoPageApp(docId : docId),
                              )
                          );
                        },
                        child: Text("메모 작성")
                    )
                  ],
                ),
            );

          },
      )
    );
  }
}
