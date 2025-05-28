import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(ToastApp());

class ToastApp extends StatelessWidget {
  const ToastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : ToastExam()
    );
  }
}


class ToastExam extends StatefulWidget {
  const ToastExam({super.key});

  @override
  State<ToastExam> createState() => _ToastExamState();
}

class _ToastExamState extends State<ToastExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("토스트 메시지")),
      body : Center(
        child: ElevatedButton(
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
            child: Text("클릭!")
        ),
      )

    );
  }
}
