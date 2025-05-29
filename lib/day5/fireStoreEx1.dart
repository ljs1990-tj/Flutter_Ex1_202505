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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

// MyApp의 상태 관리 클래스
class _MyAppState extends State<MyApp> {
  final TextEditingController _name = TextEditingController(); // 이름 입력 컨트롤러
  final TextEditingController _age = TextEditingController(); // 나이 입력 컨트롤러

  // Firestore에 사용자 추가하는 함수
  void _addUser() async {
    if (_name.text.isNotEmpty && _age.text.isNotEmpty) { // 입력 필드가 비어있지 않은지 확인
      FirebaseFirestore fs = FirebaseFirestore.instance; // Firestore 인스턴스 생성
      CollectionReference users = fs.collection("users"); // "users" 컬렉션 참조

      await users.add({
        'name': _name.text, // 이름 저장
        'age': int.parse(_age.text), // 나이를 정수로 변환하여 저장
        'test': "zzz"
      });

      _name.clear(); // 입력 필드 초기화
      _age.clear();
    } else {
      print("이름 또는 나이 입력"); // 입력값이 없을 경우 메시지 출력
    }
  }
  // Firestore에서 특정 사용자의 데이터를 업데이트하는 함수
  void _updateUser() async {
    FirebaseFirestore fs = FirebaseFirestore.instance; // Firestore 인스턴스 생성
    CollectionReference users = fs.collection("users"); // "users" 컬렉션 참조

    QuerySnapshot snap = await users.where('name', isEqualTo: 'hong').get(); // 'hong' 사용자를 조회
    for (QueryDocumentSnapshot doc in snap.docs) {
      users.doc(doc.id).update({'age': 30}); // 나이 값을 30으로 업데이트
    }
  }

  // Firestore에서 사용자 목록을 스트림으로 가져와 화면에 표시하는 함수
  Widget _listUser() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(), // 사용자 목록 스트림
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
          // 아직 데이터가 로드되지 않았을 경우 빈 리스트 반환
          if (!snap.hasData) {
            return CircularProgressIndicator(); // 로딩 상태 표시
          }

          // 사용자 목록 데이터로 리스트 뷰 생성
          return ListView(
            children: snap.data!.docs.map((doc) {
              return ListTile(
                title: Text(doc['name']), // 이름 표시
                subtitle: Text('나이: ${doc['age']}'), // 나이 표시
              );
            }).toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("firestore")),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 위젯 중앙 정렬
              children: [
                // 이름 입력 필드
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: "이름",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // 나이 입력 필드
                TextField(
                  controller: _age,
                  decoration: InputDecoration(
                    labelText: "나이",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // 사용자 추가 버튼
                ElevatedButton(
                  onPressed: _addUser, // 버튼 클릭 시 사용자 추가 함수 호출
                  child: Text("사용자 추가!"),
                ),
                SizedBox(height: 20),
                // 사용자 수정 버튼
                ElevatedButton(
                  onPressed: _updateUser, // 버튼 클릭 시 사용자 수정 함수 호출
                  child: Text("사용자 수정!"),
                ),
                SizedBox(height: 20),
                // 사용자 목록 표시
                Expanded(child: _listUser()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}