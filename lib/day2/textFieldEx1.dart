import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldEx1());
}

class TextFieldEx1 extends StatefulWidget {
  const TextFieldEx1({super.key});

  @override
  State<TextFieldEx1> createState() => _TextFieldEx1State();
}

class _TextFieldEx1State extends State<TextFieldEx1> {
  TextEditingController _txtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body : Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _txtCtrl,
                  decoration: InputDecoration(
                    labelText: "텍스트 입력하삼",
                    hintText: "ex) test@test.com",
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.check_circle),
                    border : OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100]
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      print("입력 값 : ${_txtCtrl.text}");
                    },
                    child: Text("클릭!")
                )
              ],
            ),
        )
      )
    );
  }
}


