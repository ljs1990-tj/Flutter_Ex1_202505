import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Text("Box1", style : TextStyle(fontSize: 20)),
            height: 100, width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color : Colors.black),
              borderRadius: BorderRadius.circular(20)
            ),
          )
      ),
      // Container(height: 50, width: 50, color: Colors.blue,)
      // Image.asset("img1.jpg")
      // Text("Hello Flutter", style: TextStyle(color: Colors.blue),)
    );
  }
}
